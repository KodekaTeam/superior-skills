[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$errors = [System.Collections.Generic.List[string]]::new()
$safeRoot = $root.Replace('\', '/')

function Add-ValidationError([string]$message) {
    $errors.Add($message)
}

function Get-RepositoryRelativePath([string]$fullPath) {
    $normalizedRoot = [System.IO.Path]::GetFullPath($root).TrimEnd([char[]]@('\', '/'))
    $normalizedPath = [System.IO.Path]::GetFullPath($fullPath)
    $rootPrefix = $normalizedRoot + [System.IO.Path]::DirectorySeparatorChar

    if (-not $normalizedPath.StartsWith($rootPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
        return $null
    }

    return $normalizedPath.Substring($rootPrefix.Length).Replace('\', '/')
}

function Test-TrackedRepositoryPath([string]$fullPath) {
    $relativePath = Get-RepositoryRelativePath $fullPath
    if ([string]::IsNullOrWhiteSpace($relativePath)) {
        return $false
    }

    if ($trackedFileSet.Contains($relativePath)) {
        return $true
    }

    if (Test-Path -LiteralPath $fullPath -PathType Container) {
        $prefix = $relativePath.TrimEnd('/') + '/'
        return [bool]($trackedFiles | Where-Object { $_.StartsWith($prefix, [System.StringComparison]::Ordinal) } | Select-Object -First 1)
    }

    return $false
}

function Test-LocalReference([string]$sourceRelativePath, [string]$destination) {
    $cleanDestination = $destination.Trim().Trim('<', '>')
    if ([string]::IsNullOrWhiteSpace($cleanDestination) -or
        $cleanDestination.StartsWith('#') -or
        $cleanDestination.StartsWith('//') -or
        $cleanDestination -match '^[A-Za-z][A-Za-z0-9+.-]*:') {
        return
    }

    $pathPart = ($cleanDestination -split '[#?]', 2)[0]
    if ([string]::IsNullOrWhiteSpace($pathPart)) {
        return
    }

    try {
        $decodedPath = [System.Uri]::UnescapeDataString($pathPart)
        $sourceDirectory = Split-Path -Parent (Join-Path $root $sourceRelativePath)
        $targetPath = [System.IO.Path]::GetFullPath((Join-Path $sourceDirectory $decodedPath))
    }
    catch {
        Add-ValidationError "$sourceRelativePath contains an invalid local reference '$destination'."
        return
    }

    $targetRelativePath = Get-RepositoryRelativePath $targetPath
    if ([string]::IsNullOrWhiteSpace($targetRelativePath)) {
        Add-ValidationError "$sourceRelativePath reference '$destination' escapes the repository root."
        return
    }

    if (-not (Test-Path -LiteralPath $targetPath)) {
        Add-ValidationError "$sourceRelativePath references missing path '$destination'."
        return
    }

    if (-not (Test-TrackedRepositoryPath $targetPath)) {
        Add-ValidationError "$sourceRelativePath references untracked path '$destination'."
    }
}

function Get-ManifestAssetPaths($node) {
    if ($null -eq $node -or $node -is [string] -or $node -is [System.ValueType]) {
        return
    }

    if ($node -is [System.Collections.IEnumerable] -and -not ($node -is [System.Management.Automation.PSCustomObject])) {
        foreach ($item in $node) {
            Get-ManifestAssetPaths $item
        }
        return
    }

    $assetFields = @('logo', 'logoDark', 'composerIcon', 'composerIconDark', 'screenshots')
    foreach ($property in $node.PSObject.Properties) {
        if ($assetFields -contains $property.Name) {
            foreach ($value in @($property.Value)) {
                if ($value -is [string] -and -not [string]::IsNullOrWhiteSpace($value)) {
                    Write-Output $value
                }
            }
        }
        else {
            Get-ManifestAssetPaths $property.Value
        }
    }
}

$trackedFiles = @(& git -c "safe.directory=$safeRoot" -C $root ls-files --cached 2>$null) |
    ForEach-Object { $_.Trim().Replace('\', '/') } |
    Where-Object { -not [string]::IsNullOrWhiteSpace($_) }

if ($LASTEXITCODE -ne 0 -or $trackedFiles.Count -eq 0) {
    Add-ValidationError 'Unable to enumerate tracked repository files with Git.'
}

$trackedFileSet = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::Ordinal)
$trackedFiles | ForEach-Object { [void]$trackedFileSet.Add($_) }

if ($trackedFiles | Where-Object { $_.StartsWith('.agents/skills/', [System.StringComparison]::Ordinal) }) {
    Add-ValidationError 'Tracked skills must live only under the canonical root skills/ directory; remove the .agents/skills/ mirror.'
}

$rawVersion = (Get-Content -Raw (Join-Path $root 'VERSION')).Trim()
$version = $rawVersion -replace '^v', ''
if ($version -notmatch '^\d+\.\d+\.\d+([+-][0-9A-Za-z.-]+)?$') {
    Add-ValidationError "VERSION must contain a semantic version; found '$rawVersion'."
}

$manifests = @(
    'plugin.json',
    '.codex-plugin/plugin.json',
    '.claude-plugin/plugin.json',
    '.cursor-plugin/plugin.json',
    'gemini-extension.json',
    'kimi.plugin.json'
)

foreach ($relativePath in $manifests) {
    $path = Join-Path $root $relativePath
    try {
        $manifest = Get-Content -Raw $path | ConvertFrom-Json
        if ($manifest.name -ne 'superior-skills') {
            Add-ValidationError "$relativePath has an unexpected plugin name."
        }
        if ($manifest.version -ne $version) {
            Add-ValidationError "$relativePath version '$($manifest.version)' does not match VERSION '$version'."
        }
    }
    catch {
        Add-ValidationError "$relativePath is missing or invalid JSON: $($_.Exception.Message)"
    }
}

try {
    $portableManifest = Get-Content -Raw (Join-Path $root 'plugin.json') | ConvertFrom-Json
    $expectedSchema = 'https://agent-plugins.org/schemas/1.0.0/plugin.schema.json'
    if ($portableManifest.'$schema' -ne $expectedSchema) {
        Add-ValidationError "plugin.json must use Agent Plugins schema '$expectedSchema'."
    }
}
catch {
    Add-ValidationError "Unable to validate the portable plugin schema: $($_.Exception.Message)"
}

try {
    $codexManifest = Get-Content -Raw (Join-Path $root '.codex-plugin/plugin.json') | ConvertFrom-Json
    $shortDescription = [string]$codexManifest.interface.shortDescription
    if ([string]::IsNullOrWhiteSpace($shortDescription) -or $shortDescription.Length -gt 30) {
        Add-ValidationError '.codex-plugin/plugin.json interface.shortDescription must contain 1 to 30 characters.'
    }
}
catch {
    Add-ValidationError "Unable to validate Codex interface metadata: $($_.Exception.Message)"
}

try {
    $kimiManifest = Get-Content -Raw (Join-Path $root 'kimi.plugin.json') | ConvertFrom-Json
    if ($kimiManifest.skills -ne './skills/') {
        Add-ValidationError "kimi.plugin.json must expose canonical skills from './skills/'."
    }
}
catch {
    Add-ValidationError "Unable to validate Kimi plugin metadata: $($_.Exception.Message)"
}

$marketplaces = @(
    '.agents/plugins/marketplace.json',
    '.claude-plugin/marketplace.json',
    '.cursor-plugin/marketplace.json'
)

foreach ($relativePath in $marketplaces) {
    $path = Join-Path $root $relativePath
    try {
        $marketplace = Get-Content -Raw $path | ConvertFrom-Json
        if (-not $marketplace.plugins -or $marketplace.plugins[0].name -ne 'superior-skills') {
            Add-ValidationError "$relativePath does not expose superior-skills."
        }
    }
    catch {
        Add-ValidationError "$relativePath is missing or invalid JSON: $($_.Exception.Message)"
    }
}

foreach ($relativePath in ($manifests + $marketplaces)) {
    $path = Join-Path $root $relativePath
    try {
        $document = Get-Content -Raw $path | ConvertFrom-Json
        foreach ($assetPath in @(Get-ManifestAssetPaths $document)) {
            if ($assetPath -match '^[A-Za-z][A-Za-z0-9+.-]*:') {
                continue
            }

            $resolvedAssetPath = [System.IO.Path]::GetFullPath((Join-Path $root $assetPath))
            if (-not (Test-Path -LiteralPath $resolvedAssetPath -PathType Leaf)) {
                Add-ValidationError "$relativePath references missing asset '$assetPath'."
            }
            elseif (-not (Test-TrackedRepositoryPath $resolvedAssetPath)) {
                Add-ValidationError "$relativePath references untracked asset '$assetPath'."
            }
        }
    }
    catch {
        Add-ValidationError "Unable to validate assets in $relativePath`: $($_.Exception.Message)"
    }
}

$canonical = Join-Path $root 'skills'
$skillDirectories = Get-ChildItem -LiteralPath $canonical -Directory

if ($skillDirectories.Count -eq 0) {
    Add-ValidationError 'No canonical skills were found under skills/.'
}

foreach ($directory in $skillDirectories) {
    $skillPath = Join-Path $directory.FullName 'SKILL.md'
    if (-not (Test-Path -LiteralPath $skillPath -PathType Leaf)) {
        Add-ValidationError "Missing SKILL.md in skills/$($directory.Name)."
        continue
    }

    $content = Get-Content -Raw $skillPath
    $frontmatter = [regex]::Match($content, '(?ms)\A---\s*\r?\n(.*?)\r?\n---')
    if (-not $frontmatter.Success) {
        Add-ValidationError "skills/$($directory.Name)/SKILL.md has invalid YAML frontmatter boundaries."
        continue
    }

    $name = [regex]::Match($frontmatter.Groups[1].Value, '(?m)^name:\s*([^\r\n]+)$').Groups[1].Value.Trim()
    $description = [regex]::Match($frontmatter.Groups[1].Value, '(?m)^description:\s*([^\r\n]+)$').Groups[1].Value.Trim()

    if ($name -ne $directory.Name) {
        Add-ValidationError "Skill folder '$($directory.Name)' declares name '$name'."
    }
    if ([string]::IsNullOrWhiteSpace($description)) {
        Add-ValidationError "Skill '$($directory.Name)' has no description."
    }
    if ($directory.Name -notmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$') {
        Add-ValidationError "Skill folder '$($directory.Name)' is not lowercase kebab-case."
    }
}

$textExtensions = @('.md', '.json', '.ps1', '.py')
$textNames = @('.gitignore', 'LICENSE', 'VERSION')
$strictUtf8 = [System.Text.UTF8Encoding]::new($false, $true)
$validatedTextFiles = 0
$validatedReferences = 0

foreach ($relativePath in $trackedFiles) {
    $extension = [System.IO.Path]::GetExtension($relativePath).ToLowerInvariant()
    $fileName = [System.IO.Path]::GetFileName($relativePath)
    if ($textExtensions -notcontains $extension -and $textNames -notcontains $fileName) {
        continue
    }

    $path = Join-Path $root $relativePath
    try {
        $bytes = [System.IO.File]::ReadAllBytes($path)
        $content = $strictUtf8.GetString($bytes)
        $validatedTextFiles++
    }
    catch {
        Add-ValidationError "$relativePath is not valid UTF-8: $($_.Exception.Message)"
        continue
    }

    if ($relativePath -ne 'scripts/validate-plugin.ps1' -and
        $content -match '\{\{[A-Z][A-Z0-9_]*\}\}|\b(?:X\.Y\.Z|PREVIOUS_VERSION|REPLACE_ME)\b') {
        Add-ValidationError "$relativePath contains an unresolved scaffold placeholder."
    }

    if ($extension -ne '.md') {
        continue
    }

    $destinations = [System.Collections.Generic.List[string]]::new()
    [regex]::Matches($content, '!?' + '\[[^\]]*\]\((?<destination><[^>]+>|[^)\s]+)') |
        ForEach-Object { $destinations.Add($_.Groups['destination'].Value) }
    [regex]::Matches($content, '(?i)(?:href|src)\s*=\s*["''](?<destination>[^"'']+)["'']') |
        ForEach-Object { $destinations.Add($_.Groups['destination'].Value) }

    foreach ($destination in $destinations) {
        Test-LocalReference $relativePath $destination
        $validatedReferences++
    }
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Output "Validated $($skillDirectories.Count) canonical skills, $($manifests.Count) plugin manifests, $($marketplaces.Count) marketplaces, $validatedTextFiles tracked text files, $validatedReferences documentation references, and version $version."

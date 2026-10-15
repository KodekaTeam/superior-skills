[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$errors = [System.Collections.Generic.List[string]]::new()

function Add-ValidationError([string]$message) {
    $errors.Add($message)
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
    '.cursor-plugin/plugin.json'
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

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Output "Validated $($skillDirectories.Count) canonical skills, 4 plugin manifests, 3 marketplaces, and version $version."

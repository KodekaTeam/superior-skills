# Semantic HTML and Search Discovery

Use this reference for public pages whose content must be understood, linked, or discovered outside the application: landing pages, homepages, product or service pages, articles, documentation, catalogs, and public detail routes. Do not impose search-oriented metadata on authenticated tools, private dashboards, or transient application states without a product requirement.

Semantic HTML supports accessibility, navigation, maintainability, and search interpretation, but it does not guarantee ranking. Preserve the project's framework, routing, metadata, and rendering conventions instead of adding a parallel SEO system.

## Establish one document hierarchy

- Use elements according to meaning and behavior: `header`, `nav`, `main`, `article`, `section`, `aside`, `footer`, lists, tables, links, buttons, and form controls.
- Keep one primary `main` landmark for the rendered page and give repeated navigation regions distinguishable names when needed.
- Provide one clear page-level heading, then nest headings according to content relationships. Do not choose heading levels for visual size or skip levels merely to obtain a style.
- Give a `section` or `article` a useful heading when its boundary needs to be understood; use a neutral container when it does not represent a semantic region.
- Use real links with resolvable destinations for navigation and buttons for actions. Do not make a clickable `div` imitate either.
- Keep important text as text. Images, canvas, generated decoration, and icon-only controls must not become the sole carriers of essential meaning.

Load `superior-accessibility` when heading structure, landmarks, accessible names, keyboard behavior, or assistive-technology output requires dedicated verification.

## Keep structure stable across layouts

Maintain one authoritative content and semantic hierarchy across breakpoints. Prefer CSS re-composition over duplicate desktop and mobile copies of primary content. Duplication can create conflicting reading order, repeated IDs, inconsistent state, and ambiguous indexing.

When the visual position changes, preserve a logical source order for reading, keyboard navigation, and content interpretation. If different source structures are genuinely required, prove that both expose the same content contract and that only the intended structure is available to users and crawlers in each state.

## Own page discovery metadata

Use the repository's established route or framework metadata owner. For indexable pages, verify the relevant contract includes:

- a specific document title that identifies the page;
- a concise description derived from real page content when the project uses descriptions;
- a canonical URL when duplicate or parameterized routes can represent the same content;
- intentional robots directives rather than inherited accidental blocking;
- stable, crawlable internal links to important public destinations;
- sitemap inclusion when the project maintains a sitemap and the route belongs in it;
- social metadata only when sharing previews are part of the product requirement.

Metadata must describe the rendered page. Do not generate keyword lists, doorway pages, hidden text, unsupported claims, or large sets of near-duplicate pages for search traffic.

## Make public content available

For content intended to be indexed, confirm that the project's supported rendering strategy exposes meaningful page content and link destinations without requiring a user gesture. Follow the existing SSR, SSG, prerendering, or crawler-compatible client-rendering approach; do not change rendering architecture solely from assumption.

Preserve meaningful HTTP outcomes where the framework owns them: successful content, redirects, missing resources, and server failures should not all appear as a successful empty shell. Keep authentication-only and private content out of public discovery paths.

## Add structured data only from evidence

Use structured data only when a supported schema accurately represents visible page content and the repository already owns or explicitly requests that capability. Keep identifiers, prices, availability, authorship, dates, ratings, and organization details synchronized with authoritative data. Never invent fields merely to satisfy a validator.

## Verify

Inspect both the rendered DOM and the HTML or rendering output available through the project's delivery path. Check:

- landmarks and heading outline;
- source order at representative breakpoints;
- unique IDs and valid link destinations;
- page title, description, canonical, and robots output where applicable;
- discoverability of important public routes through ordinary links;
- absence of duplicated hidden primary content;
- agreement between structured data and visible authoritative content.

Report which discovery requirements were applicable and which were not exercised. Do not describe a page as SEO-ready solely because it uses semantic elements or passes an automated audit.

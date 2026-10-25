# Reference Source Hygiene

Use this guide when a screenshot, template, repository, demo, competitor product, or other third-party source informs an interface. References can guide decisions without becoming the product's identity.

## Classify the reuse before implementation

| Use of the source | Required handling |
| --- | --- |
| Inspiration only | Recreate the relevant hierarchy, interaction, or visual principle in the project's own system. Do not add the source name, attribution, or license merely because it was consulted. |
| Small copied excerpt or asset | Verify that its license permits the intended use. Keep only what is necessary and preserve any notice required for that material. |
| Substantial code, content, or asset adaptation | Review the source terms before shipping, retain required copyright and license notices, and identify the derived material in the project's established third-party notice location. |
| Unknown, incompatible, or unverifiable terms | Do not copy the material. Reimplement from product requirements and observable behavior, or ask the user for a permitted source. |

Do not make a legal conclusion from visual similarity alone. The relevant question is what material entered the project and what that material's terms require.

## Separate reference evidence from product content

Prefer, in order:

1. existing product copy, tokens, components, assets, and domain language;
2. user-supplied facts and approved brand material;
3. neutral placeholders that state their role and are visibly non-production.

Do not carry over source-specific:

- product, company, template, or author names;
- slogans, testimonials, fictional customers, people, metrics, or addresses;
- domains, social links, tracking identifiers, repository URLs, or contact details;
- page titles, descriptions, Open Graph text, structured data, manifests, or package identifiers;
- comments, component names, asset filenames, alt text, test fixtures, or seed data that expose the source identity.

Rename implementation details when they would leave misleading provenance or generic template vocabulary in the maintained code. Do not rename conventional technical terms merely to make the result appear original.

## Place required notices deliberately

Follow the source license and the repository's existing convention. Typical locations are `LICENSE`, `NOTICE`, `THIRD_PARTY_NOTICES.md`, dependency metadata, or a notice adjacent to a licensed asset when its terms require that placement.

Attribution is not filler for the visible interface. Add it to product-facing UI only when the license specifically requires visible placement or the user requests a credits surface. Never remove an existing notice until the associated material and its license obligation have both been verified as absent.

## Perform a residue pass

Before delivery, search changed and generated files for the source name, distinctive demo terms, domains, and known placeholders. Inspect visible copy and the less obvious surfaces: metadata, manifests, comments, fixtures, seed data, accessibility text, filenames, and bundled assets. Remove authoring notes that promise source-derived or replacement content will be supplied later; route missing-content decisions through the interface's product-integrity rules.

Report any material retained from the source and where its required notice lives. If the result uses only high-level inspiration and no source material, do not invent attribution to make the provenance look formal.

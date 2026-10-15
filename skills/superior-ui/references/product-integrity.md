# Product Integrity for Interfaces

Use this reference when UI quality depends on claims, data, navigation, controls, forms, asynchronous work, or product states.

## Content and evidence

- Use real supplied content when available.
- Mark examples and placeholders so nobody can mistake them for production truth.
- Never invent customers, testimonials, usage counts, revenue, uptime, security certifications, rankings, or recent activity.
- Preserve unknowns. A truthful empty value is better than plausible fiction.
- Make headings and labels identify the actual task, object, or outcome. Replace broad claims with concrete capability only when the repository supports it.

## Navigation and controls

- Every link needs a valid destination or an honest unavailable state.
- Every button needs an implemented action, a disabled explanation, or removal.
- Do not use hover as the only route to essential information or controls.
- Preserve back behavior, focus location, selected state, and deep links where the existing product relies on them.
- Confirm destructive, irreversible, paid, or externally visible actions at the appropriate boundary.

## State model

Model states from the actual operation instead of adding a generic spinner and “No data” message:

- **Initial:** what the user sees before starting;
- **Loading:** what is pending and whether prior content remains valid;
- **Empty:** first use, filtered-to-zero, and genuinely absent data may need different guidance;
- **Validation:** identify the field and a recoverable correction;
- **Permission:** explain the unavailable capability without leaking protected information;
- **Error:** identify what failed, preserve input when safe, and offer a realistic retry or next step;
- **Success:** confirm the outcome and expose the next relevant action.

Do not show mutually exclusive states together. Avoid optimistic success when the authoritative operation has not completed.

## Dashboards and data displays

- Start with the question a user must answer, then choose the table, chart, summary, or alert that supports it.
- Give metrics time range, unit, comparison basis, and source when those affect interpretation.
- Use charts only when shape, comparison, or change matters. Use direct values when they answer the question faster.
- Design tables around real fields and actions; generic “Name / Status / Date” schemas conceal product requirements.
- Handle long values, missing data, zero, extremes, stale data, and partial results.

## Forms

- Labels must remain available after typing; placeholders are examples or hints, not label replacements.
- Validate near the input and again at the trusted boundary.
- Preserve entered data after recoverable failures.
- Make required format, units, constraints, and consequences clear before submission.
- Prevent duplicate submission where it could create duplicate work or charges.

## Final integrity pass

Trace one realistic user task end to end. Confirm that content remains truthful, controls perform the advertised action, state transitions are coherent, and the final result can be verified by the user.

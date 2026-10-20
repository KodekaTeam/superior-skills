# Interaction, Feedback, and Recovery

## Define observable states

For each consequential action, identify the relevant states: ready, invalid, pending, successful, partially successful, failed, cancelled, expired, or unavailable. Do not add states the product cannot produce, but do not collapse materially different outcomes into one generic message.

Feedback should answer what happened, what remains unchanged, and what the user can do next. Immediate local feedback suits direct manipulation and validation; longer work needs persistent progress or status that survives navigation when the product supports it.

## Prevent and contain errors

- Make constraints visible before submission when users can act on them.
- Use confirmation for high-impact or hard-to-reverse actions, not routine low-risk work.
- Prefer undo when reversal is reliable and less disruptive than confirmation.
- Disable an action only when the reason is apparent or explained nearby.
- Preserve valid input after expected failure and identify the affected field or step.
- Keep retries bounded and safe; do not imply an operation failed if its outcome is unknown.

## Support interruption and re-entry

Define what happens after refresh, navigation away, session expiry, offline periods, external redirects, and returning on another device when relevant. Preserve drafts or progress only within the product's privacy and data-retention contract. Tell users when unsaved work will be lost.

After an interruption, restore enough context to continue or clearly explain why the task must restart. Avoid sending users to a generic home screen when a safe, specific recovery destination exists.

## Preserve trust

Consent must be specific and reversible where policy and product behavior permit it. Do not use deceptive defaults, disguised advertisements, forced continuity, hidden subscriptions, or visual pressure that obscures meaningful alternatives. Authentication and authorization boundaries remain owned by implementation and security skills; UX defines how their requirements are understood and recovered from.

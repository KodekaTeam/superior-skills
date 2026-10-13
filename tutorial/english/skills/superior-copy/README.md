# Using `superior-copy`

This skill writes and refines user-facing text, including headings, calls to action, onboarding, empty states, error messages, and marketing copy.

## When to use it

Use it when language quality, action clarity, or product-voice consistency is the primary objective. Do not use it for code comments or neutral technical documentation unless the user specifically requests a product tone.

## Workflow

1. Find evidence of brand voice, product terminology, audience, and claims that may be stated.
2. Define what the user should understand or do after reading the text.
3. Write concrete copy suited to its interface context.
4. Check length, hierarchy, terminology consistency, and error, empty, and loading states.
5. Remove unsupported claims, statistics, testimonials, or social proof.

## Prompt examples

```text
$superior-copy Rewrite this onboarding flow to be concise and clear for new store owners. Preserve the voice used on the pricing page.
```

```text
$superior-copy Improve the dashboard CTA and empty state. Do not invent benefits that are absent from the product material.
```

## Suitable combinations

- Pair with `superior-ui` when copy is part of page implementation.
- Pair with `superior-accessibility` for control labels and error messages that everyone must understand.
- Pair with `superior-docs` only when terminology changes should be recorded as a project decision or context.

## Result checks

Every string should help the user understand the state or take action. Confirm that the voice follows available evidence, calls to action are specific, errors explain recovery, and layouts work with realistic copy lengths. Avoid universal style bans that erase the brand's character.

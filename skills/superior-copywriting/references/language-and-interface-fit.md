# Language, Localization, and Interface Fit

Use this guide when adapting copy to a language or locale, reconciling terminology, or writing for constrained interface surfaces. Respect the user's requested language, existing translations, product terminology, audience, and tone.

## Choose language from evidence

- Inspect existing locale files, product copy, terminology guides, and locale-specific formatting before introducing terms. Keep the same concept named consistently across labels, navigation, help, and errors.
- Translate meaning and intent rather than word order. Preserve domain and technical terms when the target audience and existing product convention use them; choose an established local term when it is clearer. Do not force English, formal Indonesian, or a single degree of formality onto every audience.
- Match locale conventions for dates, numbers, currency, plural forms, and text direction using the project's established internationalization system. Do not assume all locales share English pluralization or formatting.
- Preserve interpolation variables, message keys, markup, and accessibility names. Do not concatenate fragments whose order or grammatical agreement may change in another language.
- Where an intended meaning or terminology is unclear, identify the uncertainty instead of inventing a translation or changing the underlying product behavior.

## Fit copy to the real surface

- Account for button and navigation width, mobile reflow, wrapping, long translated strings, and available context. Prefer an understandable label over a shorter ambiguous one; improve the layout or allow wrapping when the text cannot be shortened without losing meaning.
- Ensure a label makes sense where it appears, including repeated controls, screen-reader names, and links read out of context. Coordinate visible and accessible labels when the interaction requires it.
- Keep essential qualifications, fees, destructive consequences, and recovery instructions understandable. Do not truncate them merely to fit a design.
- For design recreation, preserve the requested visual hierarchy and approximate text footprint as far as truthful, readable content permits. Report material differences rather than copying unapproved source identity or shrinking text until it fits.

## Verify where practical

Review the copy in its rendered context at representative narrow and wide sizes, with realistic and expanded text where relevant. Check pluralization, interpolation, punctuation, direction, truncation, and overflow through the project's existing locale and UI checks. If rendering or a locale is unavailable, state what was not verified; a draft translation is not evidence of a native-speaker review.

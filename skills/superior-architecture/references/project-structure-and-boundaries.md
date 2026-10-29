# Project Structure and Boundaries

Use this guide when starting a framework project, placing a new feature, or splitting code across files and folders. Choose structure from actual responsibilities and framework requirements; a named architecture does not require a fixed directory tree.

## Establish the existing owners

- Inspect the framework's generated entrypoints, routing, module discovery, configuration, build, and test conventions before creating or moving files. Keep framework-required paths and exports intact.
- In an existing project, follow its established boundaries and naming unless the user authorizes a change. Place new work near its real feature or owning module; do not reorganize unrelated code to introduce a preferred pattern.
- In a new project, begin with the framework's supported layout and the folders needed for current behavior. Add feature or layer directories when they own real code, not as empty scaffolding for hypothetical growth.

## Choose a useful grouping

- Group by feature when related routes, components, logic, and tests change together and feature ownership is clear.
- Group by layer when the framework or repository already uses stable shared layers and maintainers can easily trace a feature across them.
- Combine feature and layer grouping when a feature contains enough distinct responsibilities to justify it. Keep genuinely shared capabilities in an existing shared owner; do not promote one-off code prematurely.
- Separate domain decisions from transport, UI, and persistence when doing so protects a real contract, makes testing easier, or isolates a volatile dependency. Keep dependency direction consistent with the project's architecture. Avoid requiring interfaces, repositories, adapters, or dependency injection solely to imitate a diagram.

## Decide when to split a file

Consider a split when a file mixes independent responsibilities, has distinct reasons to change, couples domain rules to an external boundary, or is difficult to navigate or test as one unit. A large file can prompt inspection, but line count alone is not a rule: keep cohesive code together when a split adds indirection without a concrete benefit.

Name files and folders after the capability or responsibility they own. Avoid generic catch-all modules and one-file-per-trivial-function structures. Keep shared contracts, error handling, validation, and public behavior intact.

## Move safely

Before moving existing code, identify direct and indirect consumers: imports, package exports, routes, dynamic discovery, configuration, build scripts, tests, and external callers. Preserve framework conventions and public paths; update registrations, callers, tests, and documentation within the authorized scope. Use a compatibility path when an existing public contract requires one, and avoid broad reorganizations that are not needed for the task.

Run the project's relevant discovery, build, type, and focused behavior checks. Report the chosen owners, material boundary decisions, compatibility impact, and any unverified framework behavior.

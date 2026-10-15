# Objectives and risk model

Use this reference to decide what reliability means for the product and which failure modes deserve investment.

## Start from critical outcomes

Identify journeys whose failure causes material user, business, safety, legal, or operational harm. Decompose each journey into owned services, state, queues, providers, networks, and human operations.

Do not define reliability only as server uptime. A service can be reachable while returning incorrect data, timing out at the tail, delaying jobs beyond usefulness, or losing accepted work.

## Select indicators

A useful SLI has:

- a clearly defined population of valid events;
- a good-event criterion tied to user outcome;
- an authoritative measurement point;
- treatment for missing telemetry, retries, cached responses, and partial results;
- enough segmentation to expose critical differences;
- known delay, sampling, and retention characteristics.

Choose request-, window-, or state-based indicators according to the behavior. Avoid vanity metrics that can improve while users still fail.

## Set objectives honestly

Use accepted product, contractual, or operational requirements. If a target is provisional, label it and record who must accept it. More nines impose nonlinear cost and may conflict with delivery speed or consistency needs.

Define the window and allowed bad events. Clarify whether planned maintenance, dependency outages, client errors, or excluded traffic count. Exclusions should follow ownership and product contracts, not make reports look healthy.

## Use error budgets as decisions

An error budget connects reliability performance to release and risk decisions. Define the response to fast burn, slow burn, and exhaustion before an incident. Avoid using the budget as punishment or as permission to ignore severe isolated failures hidden by aggregate volume.

## Model failure domains

For each critical dependency or component, record:

- failure mode and trigger;
- affected journeys and blast radius;
- detection signal and delay;
- automatic behavior and operator action;
- maximum tolerable duration or loss;
- recovery dependency and estimated difficulty;
- existing evidence from tests or incidents.

Look for common-mode failure in identity, DNS, configuration, secrets, certificates, quotas, regions, deployment pipelines, control planes, and data stores. Redundant instances sharing one owner may remain one failure domain.

## Prioritize work

Prefer changes that reduce high-consequence risk, shorten detection or recovery, bound cascading failure, or make the true state observable. Do not add mechanisms whose operational complexity creates more unowned failure modes than they remove.

# Measurement, profiling, and benchmarks

Use this reference to establish credible evidence before and after a performance change.

## Choose a metric that represents the outcome

Match the metric to the constrained experience:

| Concern | Useful evidence |
| --- | --- |
| Request or job latency | distribution and tail percentiles under stated concurrency |
| Throughput | completed valid work per time with error rate and queue growth |
| Responsiveness | input or event delay, long tasks, blocked main-thread time |
| Loading | critical resource timing, meaningful render milestones, transferred bytes |
| CPU or memory | profiles, allocation rate, retained memory, saturation, pauses |
| Capacity | utilization and queue behavior at increasing representative load |
| Cost | resource consumption per successful unit of useful work |

Do not average unlike workloads into one reassuring number. Segment by route, operation, payload, tenant-safe cohort, device class, or data size when those dimensions change the result.

## Build a repeatable baseline

Record:

- revision and configuration;
- runtime, dependencies, hardware, operating system, and deployment topology;
- data volume and distribution;
- concurrency, arrival pattern, duration, and request mix;
- network and device throttling where applicable;
- cold, warm, and steady-state conditions;
- tool commands and known sources of noise.

Use production-derived shapes only through authorized and sanitized evidence. Do not copy private payloads or identifiers into fixtures.

## Profile the actual workload

Select the profiler that observes the suspected resource without changing the system excessively. Correlate samples with operation boundaries, traces, and wall-clock behavior. CPU time, elapsed time, allocation, I/O wait, lock wait, and queue delay answer different questions.

Start broad enough to find the dominant contributor, then narrow. A hot function may be necessary work called by an inefficient owner; optimize the call pattern before micro-tuning the function.

## Compare responsibly

- Use the same harness and representative workload before and after.
- Run enough iterations or duration to expose variance, warmup, pauses, and tails.
- Report distributions or confidence intervals when the decision depends on small differences.
- Randomize or alternate variants when environmental drift could bias sequential runs.
- Confirm instrumentation and profiler overhead do not dominate the result.
- Retain correctness assertions so a faster wrong result cannot win.

If the improvement disappears outside a microbenchmark, treat the broader result as authoritative for the product outcome.

## Prevent benchmark drift

A durable performance test should define what it protects, its expected environment, variance tolerance, and response to failure. Avoid brittle thresholds on shared, noisy runners. Use trend comparison, dedicated runners, repeated sampling, or coarse budgets when exact timing cannot be controlled.

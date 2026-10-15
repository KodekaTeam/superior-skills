# Resilience and graceful degradation

Use this reference when behavior must remain bounded during dependency failure, overload, latency, or partial availability.

## Compose deadlines and cancellation

Start with the caller's end-to-end deadline. Reserve time for necessary processing and recovery, then pass a shrinking deadline or cancellation signal downstream. Independent default timeouts can multiply beyond the user's tolerance and leave abandoned work consuming resources.

Define what happens when the caller disconnects: cancel safe work, continue durable accepted work, or hand it off explicitly. Do not let ownership become accidental.

## Retry selectively

Retry only when the failure is transient, the operation is safe to repeat, and another attempt can plausibly succeed within the deadline. Bound attempts and elapsed time, use exponential or policy-appropriate backoff with jitter, and respect server retry guidance when trustworthy.

Avoid retry amplification across client, gateway, service, queue, and worker layers. Assign retry ownership and expose attempt count in safe diagnostics.

## Isolate failure and overload

- Use bounded queues and concurrency limits to preserve backpressure.
- Partition pools or bulkheads only where priority or dependency isolation justifies them.
- Open circuit behavior when repeated calls cannot help, but define probing and recovery so the circuit does not remain stale.
- Shed optional or low-priority work before critical work when the product contract permits it.
- Reject early with an honest response rather than accepting work that cannot complete.

Controls must be observable. A full queue, open circuit, exhausted retry budget, or shed request should produce a safe signal with ownership.

## Design fallbacks carefully

A fallback must be safer and cheaper than the failed path. Define freshness, completeness, authorization, and user communication. Do not return stale permissions, prices, balances, inventory, or safety-critical state as if current.

Graceful degradation may disable a nonessential feature, serve a bounded cached representation, queue durable work, or switch to a simpler path. Preserve a recovery route and avoid permanent silent degraded mode.

## Validate redundancy

Check whether replicas or providers share region, control plane, credentials, network, quota, datastore, deployment, or configuration. Test failover selection, capacity, data freshness, session behavior, and failback. Redundancy without sufficient spare capacity may fail only when needed.

## Test recovery convergence

After the dependency recovers, verify queues drain at a bounded rate, retries do not stampede, circuits close correctly, caches refresh, duplicate effects remain controlled, and deferred work reaches a valid terminal state.

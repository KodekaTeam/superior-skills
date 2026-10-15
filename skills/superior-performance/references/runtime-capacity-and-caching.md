# Runtime, capacity, and caching

Use this reference when the bottleneck involves server or worker execution, resources, concurrency, I/O, queues, or caches.

## Remove or reshape work

Look first for duplicated computation, repeated serialization, N+1 calls, unnecessary round trips, oversized payloads, unbounded scans, redundant parsing, avoidable allocations, and work performed before it is needed.

Choose algorithms and data structures from observed input size and access patterns. A lower asymptotic cost matters when the workload reaches that range; a more complex implementation may be worse for small, dominant inputs.

## CPU and allocation

Use CPU profiles to distinguish compute from waiting. For managed runtimes, examine allocation rate, retention, garbage collection, pause behavior, and object lifetime rather than only total heap size.

Reuse or pool objects only when allocation is proven material and lifetime ownership remains clear. Pools can retain excess memory, leak sensitive state, and add contention.

## I/O, batching, and concurrency

Reduce round trips and batch compatible work without creating oversized requests, long locks, unfairness, or delayed partial results. Bound concurrency from downstream capacity and cancellation behavior.

Higher parallelism can reduce individual elapsed time while increasing saturation, tail latency, retries, and total cost. Measure the whole path and preserve backpressure.

## Queues and capacity

Track arrival rate, service rate, queue depth, age of oldest work, completion rate, failure rate, and saturation. Throughput that matches arrivals only briefly is not stable capacity.

Define overload behavior: reject, shed, degrade, defer, or prioritize according to the product contract. Never silently discard required work to improve latency statistics.

## Caching

Before adding a cache, define:

- authoritative source and consistency requirement;
- key, namespace, cardinality, and tenant boundary;
- fill path, expiry, invalidation, and eviction;
- stampede and cold-start behavior;
- memory or storage budget;
- behavior on cache failure;
- observability for hit rate, latency, stale reads, and load shifted downstream.

Measure end-to-end benefit. A high hit rate can still be useless if hits are cheap work or misses create damaging bursts. Do not cache authorization decisions or sensitive responses without explicit validity and isolation contracts.

## Operational tradeoffs

Record when speed is purchased with memory, replicas, precomputation, delayed consistency, larger artifacts, more network transfer, or higher service cost. Verify resource changes under sustained representative load, not only a short burst.

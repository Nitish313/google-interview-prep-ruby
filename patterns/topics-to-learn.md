# Topics to Learn

## Week 1 Discoveries

### From Contains Duplicate Problem:

**1. MapReduce with Hash Partitioning**
- **What:** Distributed computing framework for processing large datasets
- **Why:** For data that doesn't fit in single machine memory
- **When to use:** Google-scale problems, distributed systems
- **Resources to learn:**
  - Google's MapReduce paper
  - Hadoop MapReduce tutorials
- **Priority:** Medium (good for system design interviews)

**2. Bloom Filters**
- **What:** Probabilistic data structure for membership testing
- **Why:** Space-efficient, trades accuracy for memory
- **When to use:** When false positives acceptable, huge datasets
- **Resources to learn:**
  - Wikipedia: Bloom Filter
  - LeetCode problems using Bloom filters
- **Priority:** Low (advanced topic, rarely needed in coding interviews)

**3. Ruby's each_cons Method** ✅ LEARNED!
- **What:** Iterates over consecutive n-element windows
- **Use case:** Checking adjacent elements in arrays
- **Example:** `[1,2,3,4].each_cons(2)` → [1,2], [2,3], [3,4]
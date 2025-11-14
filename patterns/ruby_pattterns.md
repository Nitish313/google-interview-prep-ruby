# Ruby-specific notes:
- Hash.key?(k) is preferred over Hash.has_key?(k) (more idiomatic)
- each_with_index is cleaner than (0...length).each
- Could also use: nums.index(complement) but that's O(n) per lookup


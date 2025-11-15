# 003-contains-duplicate.rb
# LeetCode: https://leetcode.com/problems/contains-duplicate/
# Difficulty: Easy
# Date Solved: 2025-11-15
# Runtime: 34ms (Beats 67%)
# Memory: 230MB (Beats 44.13%)
#
# Problem:
# Given an integer array nums, return true if any value appears 
# at least twice in the array, and return false if every element is distinct.
#
# Examples:
# Input: nums = [1,2,3,1] → Output: true
# Input: nums = [1,2,3,4] → Output: false
#
# Constraints:
# - 1 <= nums.length <= 10^5
# - -10^9 <= nums[i] <= 10^9
#
# Approach Evolution:
#
# APPROACH 1 (Hash with counter - FIRST ATTEMPT):
# - Initialize Hash.new(0) for counting
# - Check if counter[num] > 0
# - Works but unnecessary - we don't need counts, just existence!
#
# APPROACH 2 (Set - OPTIMAL):
# - Use Set for O(1) existence checks
# - Check if element exists before adding
# - Time: O(n), Space: O(n)
# - BEST for interviews - clear intent
#
# Key Insights:
# - Set.include? is O(1) vs Array.include? which is O(n)
# - Set is semantically correct - checking "existence" not "count"
# - Ruby's Set requires 'require set' - not built-in like Hash
# - For duplicate detection, Set > Hash > Array
# - Sorting approach: O(n log n) time but O(1) space trade-off

require 'set'

# ==================== SOLUTION 1: SET (OPTIMAL) ====================

def contains_duplicate(nums)
  # Per constraints: 1 <= nums.length, so no need to check empty/nil
  # Single element can't be duplicate, but loop handles this correctly
  
  seen = Set.new
  
  nums.each do |num|
    return true if seen.include?(num)
    seen << num
  end
  
  false
end

# Time Complexity: O(n) - single pass through array
# Space Complexity: O(n) - set stores up to n elements

# ==================== SOLUTION 2: HASH (WORKS BUT OVERKILL) ====================

def contains_duplicate_using_hash(nums)
  counter = Hash.new(0)
  
  nums.each do |num|
    return true if counter[num] > 0
    counter[num] += 1
  end
  
  false
end

# Time Complexity: O(n)
# Space Complexity: O(n)
# Note: Hash is overkill here - we don't need counts, just existence

# ==================== SOLUTION 3: RUBY'S UNIQ (ELEGANT) ====================

def contains_duplicate_using_uniq(nums)
  # Compare sizes instead of entire arrays for efficiency
  nums.size != nums.uniq.size
end

# Time Complexity: O(n) - uniq is O(n)
# Space Complexity: O(n) - uniq creates new array
# Note: Elegant but less explicit for interviews

# ==================== SOLUTION 4: SORTING (SPACE-OPTIMIZED) ====================

def contains_duplicate_sort(nums)
  sorted = nums.sort
  
  # Use each_cons(2) for consecutive pairs - idiomatic Ruby!
  sorted.each_cons(2) do |a, b|
    return true if a == b
  end
  
  false
end

# Time Complexity: O(n log n) - due to sort
# Space Complexity: O(1) or O(n) depending on Ruby's sort implementation
# Trade-off: Slower but uses less space

# ==================== TEST CASES ====================

puts "✅ Basic Test Cases:"
p contains_duplicate([1,2,3,1])                    # true
p contains_duplicate([1,2,3,4])                    # false
p contains_duplicate([1,1,1,3,3,4,3,2,4,2])       # true

puts "\n✅ Edge Cases:"
p contains_duplicate([1])                          # false - single element
p contains_duplicate([1,1])                        # true - two same
p contains_duplicate([1,2])                        # false - two different
p contains_duplicate([0,0])                        # true - zeros
p contains_duplicate([-1,-1])                      # true - negatives

puts "\n⚡ Performance Test:"
large_array = (1..10000).to_a
p contains_duplicate(large_array)                  # false - all distinct
large_array_dup = (1..10000).to_a + [5000]
p contains_duplicate(large_array_dup)              # true - one duplicate

puts "\n🔍 Comparing All Approaches:"
test_array = [1,2,3,4,5,1]

puts "Set approach: #{contains_duplicate(test_array)}"
puts "Hash approach: #{contains_duplicate_using_hash(test_array)}"
puts "Uniq approach: #{contains_duplicate_using_uniq(test_array)}"
puts "Sort approach: #{contains_duplicate_sort(test_array)}"

# ==================== INTERVIEW TALKING POINTS ====================
#
# Q: "Why Set instead of Hash?"
# A: "We only need to check existence, not count occurrences. 
#     Set is semantically clearer - it represents a collection of unique items.
#     Both have O(1) lookup, but Set expresses intent better."
#
# Q: "What if we can't use extra space?"
# A: "We can sort the array first (O(n log n)), then check adjacent elements.
#     This uses O(1) extra space but trades off time complexity.
#     However, sorting may modify the original array, which could be a constraint."
#
# Q: "What about the uniq approach?"
# A: "It's elegant and idiomatic Ruby, but in an interview, I prefer the Set approach
#     because it's more explicit and easier to explain the algorithm step-by-step.
#     Also, uniq creates a new array, so it's less space-efficient in practice."
#
# Q: "How would you optimize for very large arrays?"
# A: "For very large arrays that don't fit in memory:
#     1. If data is on disk, we could use external sorting
#     2. If distributed, we could use MapReduce with hash partitioning
#     3. For streaming data, we could use probabilistic data structures like Bloom filters
#     But for arrays that fit in memory, Set with O(n) time is optimal."
#
# Q: "What's the space complexity in worst case?"
# A: "O(n) when all elements are distinct. We'd store all n elements in the Set.
#     Best case is O(1) when first two elements are duplicates - we return immediately."
#
# Ruby-Specific Notes:
# - require 'set' is needed - Set is not built-in like Hash/Array
# - Set#include? and Set#add (or <<) are both O(1) average case
# - each_cons(n) yields consecutive n-element windows - great for adjacent checks
# - uniq uses hash internally, so it's also O(n) time

# LEARNINGS
# An array has each_cons method
# each_cons basically takes an integer having number of elements less than the total size of element
# Here, we can write sorted.each_cons(2). This will pick 2 consecutive elements from the array.
# which is how we can check if the next element is the same to the currrent element or not

# MapReduce with hash patitioning: very large data that does not fit in memory, we can use this
  # - NEED TO LEARN ABOUT THIS
  # Bloom filters and probabilistic data structures - NEED TO LEARN
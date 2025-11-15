# 001-two-sum.rb
# LeetCode: https://leetcode.com/problems/two-sum/
# Difficulty: Easy
# Date Solved: 2025-11-14
# Updated: 2025-11-15 (optimized with hash approach)
#
# Runtime: 52ms (Beats 54%)
# Memory: 211MB (Beats 70%)
#
# Problem:
# Given an array of integers nums and an integer target, 
# return indices of the two numbers that add up to target.
#
# Constraints:
# - 2 <= nums.length <= 10^4
# - Each input has exactly one solution
# - Cannot use same element twice
#
# Approach Evolution:
# 
# ❌ FIRST ATTEMPT (O(n²) - 778ms, beats only 12.73%):
# - Used nums.index() and nums.include?() inside loop
# - Each call searches entire array = O(n) per iteration
# - Total: O(n²) time complexity
# 
# ✅ OPTIMIZED APPROACH (O(n) - 52ms, beats 54%):
# - Use hash to store seen numbers and their indices
# - For each number, check if (target - number) exists in hash
# - Hash lookup is O(1) instead of O(n)
# - Trade space for time: O(n) space for O(n) time
#
# Time Complexity: O(n) - single pass through array
# Space Complexity: O(n) - hash stores up to n elements
#
# Key Learning:
# - Avoid repeated linear searches (index, include?, find)
# - Hash/Set lookups are O(1) - use them for "does X exist?" checks
# - In Ruby: seen.key?(x) is more idiomatic than seen.has_key?(x)

def two_sum(nums, target)
  # Edge case: array too small
  return nil if nums.nil? || nums.length < 2
  
  seen = {}
  
  nums.each_with_index do |num, idx|
    complement = target - num
    
    # If complement exists in hash, we found the pair!
    return [seen[complement], idx] if seen.key?(complement)
    
    # Store current number and its index for future lookups
    seen[num] = idx
  end
  
  # No solution found (shouldn't happen per problem constraints)
  nil
end

# ==================== TEST CASES ====================

puts "✅ Basic Test Cases:"
p two_sum([2, 7, 11, 15], 9)  # Expected: [0, 1]
p two_sum([3, 2, 4], 6)        # Expected: [1, 2]
p two_sum([3, 3], 6)           # Expected: [0, 1]

puts "\n✅ Edge Cases:"
p two_sum([-1, -2, -3, -4, -5], -8)  # Expected: [2, 4]
p two_sum([0, 4, 3, 0], 0)           # Expected: [0, 3]
p two_sum([1, 2], 3)                 # Expected: [0, 1]
p two_sum([1000000000, 999999999, 1], 1999999999)  # Large numbers

puts "\n❌ No Solution (returns nil):"
p two_sum([1, 2], 10)          # Expected: nil

# ==================== INTERVIEW TALKING POINTS ====================
#
# Q: "Why hash instead of array for seen values?"
# A: "Hash gives O(1) lookup vs O(n) for array.include?(). 
#     Critical for optimization."
#
# Q: "What if array is sorted?"
# A: "Could use two pointers from both ends, but that's O(1) space 
#     vs O(n) for hash. However, we'd lose original indices unless 
#     we track them separately."
#
# Q: "Space complexity concerns?"
# A: "If space is critical, brute force O(n²) uses O(1) space. 
#     But Google values efficiency, so O(n) time with O(n) space 
#     is the right trade-off."
#
# Q: "Why not use nums.index() in the loop?"
# A: "nums.index() is O(n) per call. Inside a loop, that's O(n²). 
#     Hash lookup is O(1), keeping us at O(n) overall."
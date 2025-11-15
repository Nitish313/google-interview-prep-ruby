# @param {Integer[]} nums
# @return {Boolean}

# 003-contains-duplicate.rb
# LeetCode: https://leetcode.com/problems/contains-duplicate/
# Difficulty: Easy
# Date Solved: 2025-11-15
# Runtime: 34 ms (Beats 67%)
# Memory: 230 MB (Beats 44.13%)
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
# Approach 1:
# My first approach was to initiate a counter hash with default value set to 0
# traverse over each element in the nums array
# Return true if the key is already present in the hash with the current value
# Else update the value for the key(curr_value) to 1 and move to the next element
# Return false if the traversal is done for all the elements and none of them satisfies the above scenario

# APPROACH 2
# Second approach is to initiate a Set and similar as above, traverse through each element in the nums array
# If the num has already been pushed to the Set(s), return true
# Else push that element into the set and move the next element and proceed as above
#
# Time Complexity: O(?)
# Space Complexity: O(?)
#
# Key Insights:
# [WHAT DID YOU LEARN?]

require 'set'
def contains_duplicate(nums)
  # Edge cases
  return false if nums.empty? || nums.nil? || nums.size == 1

  s = Set.new
  nums.each do |num|
    return true if s.include?(num)

    s << num
  end

  false
end

def contains_duplicate_using_uniq(nums)
  return false if nums.empty? || nums.nil? || nums.size == 1

  return nums != nums.uniq
end

def contains_duplicate_using_hash(nums)
  # Approach 2
  return false if nums.empty? || nums.nil? || nums.size == 1
  counter = Hash.new(0)
  nums.each do |num|
    return true if counter[num] > 0
    counter[num] += 1
  end

  false
end

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

# ==================== ALTERNATIVE APPROACHES ====================

# Approach 2: Sorting (if space is constrained)
def contains_duplicate_sort(nums)
  # YOUR ALTERNATIVE SOLUTION
  sorted = nums.sort
  arr_size = sorted.size
  sorted.each_with_index do |n, i|
    return true if sorted[i+1] == n && i < arr_size - 1
  end

  false
end

# ==================== INTERVIEW TALKING POINTS ====================
#
# Q: "Why Set instead of Hash?"
# A: As we are only looking for the element and not the indexes related to the value, using Set is a better approach for space-time complexity
#
# Q: "What if we can't use extra space?"
# A: We can sort the array and check if the next element is the same. This will come with a time complexity overhead.
#
# Q: "How would you optimize for very large arrays?"
# A: For very large arrays, using set is a better approach as we just need to return true if the current element exists in the Set else, we will push the current element to the Set and move forward with the next element doing the same.
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
# 001-two-sum.rb
# LeetCode: https://leetcode.com/problems/two-sum/
# Difficulty: Easy
# Date Solved: 2025-11-14
# Accepted
# 778 ms Beats 12.73%
# 211.72 MB Beats 96.50%


# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

# You may assume that each input would have exactly one solution, and you may not use the same element twice.

# You can return the answer in any order.

 

# Example 1:

# Input: nums = [2,7,11,15], target = 9
# Output: [0,1]
# Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
# Example 2:

# Input: nums = [3,2,4], target = 6
# Output: [1,2]
# Example 3:

# Input: nums = [3,3], target = 6
# Output: [0,1]

# Approach:
# - Run a loop on the nums array
# - Calculate the complement number that would sum up to the target when added to the curr number
# - Calculate index of the target number
# - Check if the target number is included in the nums array
# - Return the index of the curr_number and the target number if so
# - If not, move to the next number in nums array and follow the same procedure as above


def two_sum(nums, target)
  nums.each_with_index do |num, i|
    target_num = target - num
    target_num_index = nums.index(target_num)
    if nums.include?(target_num) && i != target_num_index
      return [i, target_num_index]
    else
      next
    end
  end

  # Time limit exceeded
  # for num in nums
#     curr_idx = nums.index(num)
#     for idx in ((curr_idx + 1)..(nums.size - 1)).to_a
#         if nums[idx] == target - num
#             return [curr_idx, idx]
#         else
#             next
#         end
#     end
  # end
end

pp two_sum([2,7,11,15], 9)
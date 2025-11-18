# https://leetcode.com/problems/maximum-subarray/

# Brute force approach
# Time complexity(O(n^2)): Some of the test cases will on Leetcode due to timeout

# Approach:
# We will run two loops:
# one for the starting point to calculate the sum
# second for till which index we need to calculate the sum
# We will initiate two variables:
# max_sum(to calculate the actual max sum subarray and return at the last)
# current_sum: This will be in the local scope to calculate the sum of the variable subarray we are constructing using the inner loop
# If current_sum > max_sum, we will update max_sum with current_sum

# LOGIC
# max_sum = nums[0]
# for i from 0 upto arr_size - 1
# current_sum = 0
# for j from i upto arr_size - 1
# we will update curr_sum as curr_sum + nums[j]
# If curr_sum > max_sum, update max_sum = curr_sum

def max_sub_array_v1(nums)
  arr_size = nums.size
  max_sum = nums.first
  0.upto(arr_size - 1) do |i|
    current_sum = 0
    i.upto(arr_size - 1) do |j|
      current_sum += nums[j]
      max_sum = current_sum if current_sum > max_sum
    end
  end
  max_sum
end

# This Approach uses O(n) time-complexity
# 32 ms, beats 77.85 per cent

# Approach
# We will run only one loop which will traverse through the array elements once
# Will initial max_sum = nums[0]
# current_sum = 0
# Inside the loop, we will assign to current_sum, the greater value between the (current_sum + nums[i], nums[i])
# This logic will work because curr_sum depicts the subarray till one element before the current element,
# and adding the exact next element will maintain the subarray sequence and the curr element is also in itself is a subarray of the main array
# Hence, we are basically comparing two subarrays, one having the maximum sum till now before this iteration
# Other twos are in the scope of curr iteration
# Even if curr_sum get smaller than its previous value, the max_sum will maintain the max curr_sum calculated till now

def max_sub_array(nums)
  arr_size = nums.size
  max_sum = nums.first
  current_sum = 0
  0.upto(arr_size - 1) do |i|
    current_sum = [nums[i], current_sum + nums[i]].max
    max_sum = current_sum if current_sum > max_sum
  end
  max_sum
end

puts max_sub_array([-2,1,-3,4,-1,2,1,-5,4])
puts max_sub_array([-1])
puts max_sub_array([-2, 1])
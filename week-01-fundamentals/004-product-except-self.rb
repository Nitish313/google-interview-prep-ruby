# https://leetcode.com/problems/product-of-array-except-self
# Runtime 23 ms, beats 97 per cent using second approach
# beats 43 per cent using first approach


# There will be two passes
# We will create two arrays(prefix and suffix) with respect to the current element of the array
# prefix[i] will be the product of all the elements to the left of the curr element
# suffix[i] will be the product of all the elements to the right of the curr element

# APPROACH 1:
# 1. Calculate prefix
# For each of the indexes in the array
# if the index is 0, push 1 to the prefix array(nothing to the left of the 0th element of the array)
# else push prefix[curr_index - 1] * nums[i-1]
# 2. Calculate Suffix
# for indexes from n - 1 down to 0,
# if index is n - 1, push 1 to suffix[n - 1], nothing to the right of the last element
# Else push product of (suffix[i + 1](immediate right of the curr index) and nums[i + 1](immediate right element of the curr nums array)
# Initiate an empty result array to store the product of all right and left elements with respect to the curr index
# Return result

def product_except_self_using_extra_space(nums)
  # initiate prefix and suffix arrays
  prefix, suffix, result = [], [], []
  max_index = nums.size - 1

  max_index.downto(0) do |i|
    i == max_index ? suffix[i] = 1 : suffix[i] = suffix[i + 1] * nums[i + 1]
  end

  0.upto(max_index) do |i|
    i == 0 ? prefix[i] = 1 : prefix[i] = prefix[i - 1] * nums[i - 1]
    result[i] = prefix[i] * suffix[i]
  end

  result
end

# In order to achieve the solution using constant space, we need to calculate the result on the fly
# Initial a result array with nums.size(n) elements with each element as 1
# Initiate a variable prefix with initial value 1
# traverse through each element in the nums array
# result[i] = prefix and prefix *= nums[i]
# Now, traverse through nums array again in reverse order(n - 1 downto 0)
# suffix = 1
# result[i] = suffix and suffix *= nums[i] 
def product_except_self(nums)
  n = nums.size
  result = Array.new(n, 1)
  prefix = 1
  0.upto(n-1) do |i|
    result[i] = prefix
    prefix *= nums[i]
  end

  suffix = 1
  (n - 1).downto(0) do |i|
    result[i] *= suffix
    suffix *= nums[i]
  end

  result
end

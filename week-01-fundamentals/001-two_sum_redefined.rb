# Approach:
# Use a hash to store numbers we've seen and their indices.
# For each number, check if (target - number) exists in hash.
# This gives us O(1) lookup time instead of O(n) nested loop.
#
# Time Complexity: O(n) - single pass through array
# Space Complexity: O(n) - hash stores up to n elements
#
# Key Insights:
# - Hash lookup in Ruby is O(1) average case
# - We trade space for time (classic optimization)
# - No need to check same element twice

# Time complexity: Beats 54 per cent
# Space complexity: Beats 70 per cent

def two_sum(nums, target)
  seen = {}

  nums.each_with_index do |num, idx|
    complement = target - num
    return [seen[complement], idx] if seen.key?(complement)
    seen[num] = idx
  end
end

pp two_sum([2,7,11,15], 9)

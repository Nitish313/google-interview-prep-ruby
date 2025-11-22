# @param {Integer[]} prices
# @return {Integer}
# [7,1,5,3,6,4]
# https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

# I am first going with O(n^2) approach
# Will initiate max value with 0 first
# Will create two loops one for the bought price and another inner loop where each element will be the selling price
# Will calculate the difference inside the inner loop(pr[j] - pr[i])
# Check if this difference is greater the current max value
# If yes, update the curr max with this difference else, do not do anuthing
# Return the max value after this process is over

# This is unoptimized as it loops around the array items twice
# Need to apply some optimized method like max_sum_subarray

def max_profit_v1(pr)
  local_max = 0
  pr_size = pr.size
  0.upto(pr_size - 2) do |i|
    (i + 1).upto(pr_size - 1) do |j|
      local_max = [local_max, pr[j] - pr[i]].max
    end
  end
  local_max
end
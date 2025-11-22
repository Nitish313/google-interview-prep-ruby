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

# Below is the optimized approach in O(n) time complexity
# Runtime 60 ms, beats 25 per cent
# Here we initiate a min_price and assign it to the first ele as a starting point
# Initiate max_profit and assign a value of 0 to start with
# Loop over each element in the price array
# check if the curr prices's value is less than min_price
# If yes, reassign min_price to that value
# check if curr max if less that the difference between the curr element and min_price
# If yes, reassign max_price to this value

def max_profit_v2(pr)
  max_profit = 0
  min_price = pr[0]
  pr_size = pr.size
  1.upto(pr_size - 1) do |i|
    min_price = [pr[i], min_price].min
    max_profit = [max_profit, pr[i] - min_price].max
  end
  max_profit
end


# This is the best approach
# Just a little tweak from the above solution
# We have eliminated the .max and .min method and directly check min and max as those were creating new arrays
# Beats 58 per cent with 51 ms execution time
def max_profit(prices)
  min_price = prices[0]
  max_profit = 0
  prices.each do |price|
    min_price = price if price < min_price
    diff = price - min_price 
    max_profit = diff if diff > max_profit
  end
  max_profit
end

max_profit([7,1,5,3,6,4])
max_profit([7,6,4,3,1])
max_profit([1])

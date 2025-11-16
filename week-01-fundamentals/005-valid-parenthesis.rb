# https://leetcode.com/problems/valid-parentheses

# APPROACH 1
# Time: 13 ms, beats 8 percent
def is_valid_v1(s)
  stacked = []
  s.each_char do |c|
    if ['(', '{', '['].include?(c)
      stacked.push(c)
    elsif [')', '}', ']'].include?(c)
      popped = stacked.pop
      return false if popped.nil?
      return false unless (c == ')' && popped == '(') || (c == '}' && popped == '{' ) || (c == ']' && popped == '[')
    else
    end
  end
  stacked.empty? ? true : false
end

# APPROACH 2
# Create pairs hash with keys as opening brackets and values as corresponding closing bracket
# We took keys as opening instead of closing because when we pop the value from the stacked opening bracket, 
# it can easily be checked if popped value is equal to the corresponding value of the closing bracket using pairs[c] == popped
# For each opening bracket, we will push it into a stack
# for each closing bracket, we will pop the last element present in the stack
# if the popped value is the corresponding value for the opening bracket in the pairs hash, we will continue our iteration, or else will return false
# Once, the whole traversal is done, we will check if the stacked array is empty or not.
# If it is empty, we will return true as we got corresponding open-closing matching for all brackets
# Else will return false
# Runtime 3 ms, beats 95 per cent
# Space 211 MB, beats 53 per cent

def is_valid(s)
  return false if s.size.odd?

  pairs = {')' => '(', '}' => '{', ']' => '['}
  stacked = []
  keys, values = pairs.keys, pairs.values
  s.each_char do |c|
    if values.include?(c)
      stacked.push(c)
    elsif keys.include?(c)
      popped = stacked.pop
      return false if popped.nil?
      return false if pairs[c] != popped
    else
      return false
    end
  end

  stacked.empty?
end

# Basic test cases
s = "()"
pp is_valid(s)

s = "()[]{}"
pp is_valid(s)

s = "(]"
pp is_valid(s)

s = "([])"
pp is_valid(s)

s = "([)]"
pp is_valid(s)
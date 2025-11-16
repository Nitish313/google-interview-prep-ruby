# 005-valid-parentheses.rb
# LeetCode: https://leetcode.com/problems/valid-parentheses/
# Difficulty: Easy
# Date Solved: 2025-11-16
#
# Runtime: 3ms (Beats 95%!) 🔥
# Memory: 211MB (Beats 53%)
#
# Problem:
# Given a string s containing '(', ')', '{', '}', '[', ']',
# determine if the input string is valid.
#
# Approach Evolution:
#
# APPROACH 1 (Original with bug fixes):
# - Runtime: 13ms (Beats 8%)
# - Used array.include?() for checking - O(n) per check
# - Fixed || vs && bug
#
# APPROACH 2 (Optimized):
# - Runtime: 3ms (Beats 95%!)
# - Used hash for O(1) lookups
# - Pre-computed keys/values
# - Early return for odd-length strings
#
# Time Complexity: O(n) - single pass through string
# Space Complexity: O(n) - stack stores up to n/2 characters
#
# Key Insight: Use Stack (LIFO) + Hash for matching pairs

# ==================== APPROACH 1 (FIXED VERSION) ====================

def is_valid_v1(s)
  stacked = []
  
  s.each_char do |c|
    if ['(', '{', '['].include?(c)
      stacked.push(c)
    elsif [')', '}', ']'].include?(c)
      popped = stacked.pop
      return false if popped.nil?
      return false unless (c == ')' && popped == '(') || 
                          (c == '}' && popped == '{') || 
                          (c == ']' && popped == '[')
    end
  end
  
  stacked.empty?
end

# ==================== APPROACH 2 (OPTIMIZED - 95%!) ====================

def is_valid(s)
  # Early return: valid parentheses must have even length
  return false if s.size.odd?
  
  # Hash maps closing brackets to their opening pairs
  pairs = { ')' => '(', '}' => '{', ']' => '[' }
  stack = []
  
  s.each_char do |c|
    if pairs.key?(c)  # Closing bracket (hash lookup O(1))
      return false if stack.empty? || stack.pop != pairs[c]
    else  # Opening bracket
      stack << c
    end
  end
  
  stack.empty?
end

# ==================== ALTERNATIVE: MOST CONCISE ====================

def is_valid_v3(s)
  return false if s.size.odd?
  
  stack = []
  pairs = { ')' => '(', '}' => '{', ']' => '[' }
  
  s.each_char do |c|
    pairs.key?(c) ? (return false if stack.pop != pairs[c]) : stack << c
  end
  
  stack.empty?
end

# ==================== TEST CASES ====================

puts "✅ Basic Test Cases:"
p is_valid("()")                # true
p is_valid("()[]{}")            # true
p is_valid("(]")                # false
p is_valid("([])")              # true
p is_valid("([)]")              # false

puts "\n✅ Edge Cases:"
p is_valid("(")                 # false - unclosed
p is_valid(")")                 # false - no opening
p is_valid("")                  # true - empty string
p is_valid("((()))")            # true - nested same type
p is_valid("(((")               # false - all opening
p is_valid(")))")               # false - all closing

puts "\n✅ Complex Cases:"
p is_valid("{[]}")              # true
p is_valid("()[]{}(){}")        # true
p is_valid("({[]})")            # true
p is_valid("([{]})")            # false - wrong nesting

# ==================== PERFORMANCE COMPARISON ====================

require 'benchmark'

test_string = "(((((((((({}[]))))))))"

Benchmark.bm do |x|
  x.report("v1 (8%):") { 10000.times { is_valid_v1(test_string) } }
  x.report("v2 (95%):") { 10000.times { is_valid(test_string) } }
end

# ==================== KEY LEARNINGS ====================
#
# 1. Stack (LIFO) is perfect for matching pairs pattern
# 2. Hash.key? is O(1), Array.include? is O(n)
# 3. Early return for odd length = 50% faster on invalid cases
# 4. || vs && matters! (c == '}' || popped == '{') is WRONG
# 5. Pre-check nil before comparison prevents errors
#
# Interview Tips:
# - Explain LIFO (Last In First Out) pattern
# - LIFO is a concept related to stack data structure. It means the last element present in the stack would be the first one to be popped out and vice-versa

# - Show how stack naturally handles nesting
# - We have a nested group of brackets: "[{()}]"
# - For the first square bracket, we would push it into the stack and similarly, we will proceed for the opening curly and parenthesis brackets
# - When we reach to the first closing bracket, we will pop the last element from the stack which will be the opening parenthesis
# - Now, the remaining brackets in the stack will be closing curly and square bracket to be popped out respectively on encountering the the corresponding closing curly and square bracket
# - This way, we can handle the nested group of brackets using stack

# - Discuss time/space trade-offs
# - Time complexity will be O(n)(to traverse through each element of the input string) + O(1)(for opening-closing bracket in the pairs hash)
# - So, the Time complexity will be O(n)
# - Space complexity will be O(1)(To initiate a pairs hash for lookup)

# - Mention the odd-length optimization
# - If the number of brackets present in the string is odd, we will straightaway return false
#   This is because, in order to complete the valid combination of opening-closing brackets
#   We will always need atleast one condition to be satisfied, which is the total number of brackets in the input string should be a multiple of 2
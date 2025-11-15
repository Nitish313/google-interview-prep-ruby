# 002-valid-anagram.rb
# LeetCode: https://leetcode.com/problems/valid-anagram/
# Difficulty: Easy
# Date Solved: 2025-11-15
#
# Problem:
# Given two strings s and t, return true if t is an anagram of s.
# An anagram uses all original letters exactly once.
#
# Examples:
# Input: s = "anagram", t = "nagaram" → Output: true
# Input: s = "rat", t = "car" → Output: false
#
# Constraints:
# - 1 <= s.length, t.length <= 5 * 10^4
# - s and t consist of lowercase English letters
#
# Approach Evolution:
#
# ❌ INITIAL IDEA (didn't work):
# - Delete each character of s from t
# - Problem: String.delete! removes ALL occurrences, not just first
# - Example: s="aab", t="aba" would fail
#
# ✅ FREQUENCY COUNTING (Current approach):
# - Count frequency of each character in both strings
# - Increment for s, decrement for t
# - If all counts are 0, strings are anagrams
#
# Time Complexity: O(n) where n = s.length + t.length
# Space Complexity: O(1) - at most 26 letters in English alphabet
#
# Key Learnings:
# - Strings use .each_char not .each (unlike arrays)
# - Strings use .empty? not .blank? (Rails adds .blank?)
# - all?(value) checks if all elements equal value (no block needed)
# - Hash.new(0) creates hash with default value 0

# ==================== SOLUTION 1: FREQUENCY HASH ====================

def is_anagram(s, t)
  # Early return if lengths differ
  return false if s.size != t.size
  
  # Count character frequencies
  counter = Hash.new(0)
  
  # Increment for each char in s
  s.each_char { |c| counter[c] += 1 }
  
  # Decrement for each char in t
  t.each_char { |c| counter[c] -= 1 }
  
  # If anagram, all frequencies should be 0
  counter.values.all?(0)  # No 'return' needed - Ruby returns last expression
end

# ==================== SOLUTION 2: RUBY'S TALLY (MOST CONCISE) ====================

def is_anagram_v2(s, t)
  return false if s.size != t.size
  
  # tally returns hash of character frequencies
  # Example: "hello".chars.tally => {"h"=>1, "e"=>1, "l"=>2, "o"=>1}
  s.chars.tally == t.chars.tally
end

# ==================== SOLUTION 3: SORTING (LESS OPTIMAL) ====================

def is_anagram_v3(s, t)
  # Sorting is O(n log n) vs O(n) for hash
  # But simplest to understand
  s.chars.sort == t.chars.sort
end

# ==================== TEST CASES ====================

puts "✅ Basic Test Cases:"
p is_anagram("anagram", "nagaram")    # true
p is_anagram("rat", "car")            # false

puts "\n✅ Edge Cases:"
p is_anagram("", "")                  # true - empty strings
p is_anagram("a", "a")                # true - single char
p is_anagram("ab", "ba")              # true - two chars
p is_anagram("aab", "aba")            # true - repeated chars
p is_anagram("aabb", "abab")          # true

puts "\n❌ False Cases:"
p is_anagram("a", "ab")               # false - different lengths
p is_anagram("ab", "aa")              # false - different frequencies
p is_anagram("aacc", "ccac")          # false

puts "\n🔍 Testing All 3 Approaches:"
test_cases = [
  ["anagram", "nagaram"],
  ["rat", "car"],
  ["aab", "aba"]
]

test_cases.each do |s, t|
  v1 = is_anagram(s, t)
  v2 = is_anagram_v2(s, t)
  v3 = is_anagram_v3(s, t)
  
  puts "s='#{s}', t='#{t}'"
  puts "  Hash approach: #{v1}"
  puts "  Tally approach: #{v2}"
  puts "  Sort approach: #{v3}"
  puts "  ✅ All match!" if v1 == v2 && v2 == v3
  puts ""
end

# ==================== INTERVIEW TALKING POINTS ====================
#
# Q: "Why not sort the strings?"
# A: "Sorting is O(n log n), frequency counting is O(n). 
#     For large inputs, O(n) is significantly faster."
#
# Q: "What's the space complexity?"
# A: "O(1) because we have at most 26 lowercase English letters. 
#     Even with 10,000 chars, hash has max 26 keys."
#
# Q: "What if strings contain Unicode characters?"
# A: "Space complexity becomes O(k) where k is the character set size. 
#     Approach still works, just potentially larger hash."
#
# Q: "Why Hash.new(0) instead of {}?"
# A: "Hash.new(0) sets default value to 0, so counter[c] += 1 works 
#     even if key doesn't exist. Otherwise need counter[c] ||= 0 first."
#
# Ruby-Specific Notes:
# - .chars converts string to array: "hello".chars => ["h","e","l","l","o"]
# - .tally counts frequencies: ["h","e","l","l","o"].tally => {"h"=>1, "e"=>1, "l"=>2, "o"=>1}
# - .all?(x) checks if all elements equal x
# - .each_char is more efficient than .chars.each (doesn't create intermediate array)
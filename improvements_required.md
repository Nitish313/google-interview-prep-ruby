# 🎯 Areas for Improvement - Google Interview Prep

*Last Updated: 2025-11-15*  
*Mentor Feedback from Code Review*

---

## 1. ⏱️ Time/Space Complexity Analysis

### The Problem
Not analyzing complexity BEFORE writing code leads to inefficient first attempts.

### What You Must Do

- **Always analyze BEFORE coding**
  - Before touching the keyboard, ask: "What's the time complexity of my approach?"
  - Write it down in comments before coding
  
- **Ask the critical question:**
  - "Is this O(n) or O(n²)?"
  - "Can I do better?"
  - "What's the trade-off between time and space?"

- **Google WILL ask:**
  - "Can you optimize this?"
  - "What's the time/space complexity?"
  - "Can you do better than O(n²)?"

### Action Items
✅ For every problem, write complexity analysis in comments FIRST  
✅ If your approach is O(n²), immediately think: "Is there a hash/set solution?"  
✅ Study the Big-O cheatsheet daily: https://www.bigocheatsheet.com/

### Example Template
```ruby
# Before coding, write this:
#
# Approach 1 (Brute Force):
# Time: O(n²) - nested loops
# Space: O(1) - no extra space
#
# Approach 2 (Optimized with Hash):
# Time: O(n) - single pass
# Space: O(n) - hash storage
#
# CHOSEN: Approach 2 (better time complexity)
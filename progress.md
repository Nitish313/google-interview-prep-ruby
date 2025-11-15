# Daily Progress Log

## Day 1 - Nov 14, 2025
- **Problems Solved:** 2/2
- **Time Spent:** 2 hours
- **Challenges:** Struggled with hash default values
- **Learnings:** Hash.new(0) vs Hash.new { |h,k| h[k] = [] }
- **Tomorrow's Goal:** Solve Contains Duplicate and Product of Array

## Day 2 - Nov 15, 2025
- **Problems Solved:** 
- **Time Spent:** 
- **Challenges:** 
- **Learnings:** 
- **Tomorrow's Goal:** 


## Day 2 - Nov 15, 2025

### Problems Solved
1. **Two Sum** 
   - First attempt: O(n²) - 778ms (beats 12.73%) ❌
   - Optimized: O(n) with hash - 52ms (beats 54%) ✅
   - Key Learning: Hash lookup is O(1), array.index() is O(n)
   - Time Spent: 1 hour
   
2. **Valid Anagram**
   - Approach: Frequency counting with Hash.new(0)
   - Time: O(n), Space: O(1)
   - Key Learning: each_char vs chars, all?(0) syntax, tally method
   - Time Spent: 45 mins

### Critical Insights Today
- **Optimization matters!** O(n²) → O(n) took me from bottom 13% to top 50%
- **Hash is your best friend** for "does X exist?" problems
- **Document failed attempts** - shows thought process in interviews
- **Ruby-specific:** tally, each_char, Hash.new(default)

### Stats
- **Problems Solved:** 2/10 Week 1
- **Total Time:** 1.75 hours
- **Mentor Feedback:** Got detailed code review, updated solutions
- **Feeling:** Understanding the "why" behind optimizations! 💡

### Tomorrow's Plan (Day 3 - Nov 16)
- Contains Duplicate (Expected: 20 mins)
- Product of Array Except Self (Expected: 40 mins)
- Goal: Focus on O(n) solutions from the start!
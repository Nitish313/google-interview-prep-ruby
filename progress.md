# Daily Progress Log

## Day 1 - Nov 14, 2025

### Problems Solved
1. **Two Sum** (Initial attempt)
   - Used array.index() and include?() - O(n²)
   - Runtime: 778ms (beats 12.73%)
   - Time Spent: 1 hour
   
2. **Valid Anagram** (Initial attempt)
   - Frequency counting approach
   - Time Spent: 1 hour

### Key Learnings
- Hash.new(0) vs Hash.new { |h,k| h[k] = [] }
- Started understanding complexity analysis

### Stats
- **Problems Solved:** 2/10 Week 1
- **Total Time:** 2 hours
- **Tomorrow's Goal:** Optimize Two Sum, complete Anagram

---

## Day 2 - Nov 15, 2025

### Problems Solved
1. **Two Sum** (Optimized)
   - First attempt: O(n²) - 778ms (beats 12.73%) ❌
   - Optimized: O(n) with hash - 52ms (beats 54%) ✅
   - Key Learning: Hash lookup is O(1), array.index() is O(n)
   - Time Spent: 1 hour
   
2. **Valid Anagram** (Enhanced)
   - Approach: Frequency counting with Hash.new(0)
   - Time: O(n), Space: O(1)
   - Key Learning: each_char vs chars, all?(0) syntax, tally method
   - Added multiple solution approaches (tally, sorting)
   - Time Spent: 45 mins

### Critical Insights Today
- **Optimization matters!** O(n²) → O(n) took me from bottom 13% to top 50%
- **Hash is your best friend** for "does X exist?" problems
- **Document failed attempts** - shows thought process in interviews
- **Ruby-specific:** tally, each_char, Hash.new(default)

### Mentor Feedback
- Got detailed code review from GitHub Copilot
- Updated solutions with comprehensive test cases
- Created improvement areas guide
- Added interview talking points to solutions

### Stats
- **Problems Solved:** 2/10 Week 1 (20% complete)
- **Total Time:** 1.75 hours
- **Commits Today:** 4
- **Feeling:** Understanding the "why" behind optimizations! 💡

### Evening Session (18:00-18:50 UTC)
3. **Contains Duplicate** 🏆
   - Runtime: 34ms (beats 67%)
   - Implemented 4 different approaches
   - Added comprehensive complexity analysis
   - Added personal learning notes
   - Discovered: each_cons, MapReduce, Bloom filters
   - **Review Score: 100/100** ✅
   - Time Spent: 50 mins (including perfecting)

### Day 2 Final Stats
- **Problems Solved:** 3/10 Week 1 (30%)
- **Average Score:** 95/100
- **Total Commits:** 15+
- **Feeling:** THIS IS WHAT MASTERY FEELS LIKE! 🚀

### Tomorrow's Plan (Day 3 - Nov 16)
- Product of Array Except Self (Expected: 40 mins)
- Goal: Focus on O(n) solutions from the start!
- Goal: Add comprehensive test cases to both solutions

## Day 3 - Nov 16, 2025

### Problems Solved

4. **Product of Array Except Self** 🔥 (FIRST MEDIUM!)
   - Difficulty: Medium
   - Runtime: [YOUR STATS] 
   - Implemented 2 approaches:
     * O(n) space with prefix/suffix arrays
     * O(1) space optimized version
   - Time Spent: ~4 hours
   - Challenge: Got stuck, asked for help, debugged *= bug
   - Key Learning: Prefix/suffix pattern - will see this again!

### Day 3 Reflections

**The Struggle:**
- Spent 3+ hours stuck on this problem
- Couldn't figure out the prefix/suffix pattern initially
- Had a tiny bug: used `*` instead of `*=` 

**The Breakthrough:**
- Asked for help (smart move!)
- Understood prefix/suffix visualization
- Fixed the 1-character bug immediately
- Got ACCEPTED!

**What I Learned:**
- Getting stuck is part of the process (not failure!)
- Prefix/suffix pattern is powerful
- Small syntax details matter (`*` vs `*=`)
- Persistence > talent

**Feeling:** PROUD! First medium problem complete! 💪

### Week 1 Stats
- **Problems Solved:** 4/10 (40%)
- **Medium Problems:** 1
- **Days Active:** 3/3 (100% consistency)
- **Total Time:** ~7 hours
- **Status:** AHEAD OF SCHEDULE!

## Day 4 - Nov 18, 2025

### Problems Solved
6. **Maximum Subarray** 🔥 (SECOND MEDIUM!)
   - Runtime: 32ms (beats 77.85%) 
   - Implemented 2 approaches: O(n²) brute force + O(n) Kadane's
   - Key Learning: Kadane's Algorithm - decide "extend or restart"
   - Time Spent: ~2 hours
   
### Breakthrough Moment
- Discovered Kadane's Algorithm naturally by asking "Do I need to recalculate?"
- This is my FIRST Dynamic Programming problem solved independently!
- 77.85% - My best performance yet!

### Week 1 Stats
- **Problems Solved:** 5/10 (50% - HALFWAY!)
- **Medium Problems:** 2
- **Days Active:** 4/4 (100% streak!)
- **Feeling:** I'M GETTING FASTER! 🚀
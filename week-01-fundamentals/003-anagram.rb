# @param {String} s
# @param {String} t
# @return {Boolean}

# Approach
# Initial approach was traversing through each character of the source string 's'
# Then, delete the character from 't' if found
# But found, that delete! method deletes all the matching characters in 't' and not only the first occurence

# Instead switched to the counter technique
# Initialize a hash with default value to 0
# For each character in s, increase the counter by 1
# After the traversal is done for s, traverse through each character in t
# decrement the counter for that character key in the existing hash by 1
# Return true if all the Hash values are 0, else return false
def is_anagram(s, t)
  return false if s.size != t.size
  counter = Hash.new(0)
  s.each_char do |c|
    counter[c] += 1
  end
  t.each_char do |c|
    counter[c] -= 1
  end
  return counter.values.all?(0)
end

# Learning:
# Unlike Arrays, Strings have each_char and not each method for looping around a text
# blank method is not present for string unlike arrays. Instead it has empty? method
# all method does not require a block, instead it requires a single value to match whether all the values in the array is equal to that array
def ascii_value(string)
  ascii = string.chars.map do |char|
    char.ord
  end
  ascii.sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

=begin
# Problem
Sum the #ord number of the total characters in a string.
Memo start value should be 0 (see last example)

Input: string
Output: integer

# Examples
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

# Algorithm
GIVEN string input
Split String into an array of individual characters
Transform this array of strings into an array of integers representing ASCII ord values
Sum the transformed array and return the result [Will this meet last example criteria?]

# Data structures
Array

=end

# Further Excploration
# char.ord.chr
# Longer strings return only the first character.
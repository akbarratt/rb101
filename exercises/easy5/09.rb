def crunch(string)
  result = ''
  string.chars.each {|char| result << char unless result[-1] == char}
  result
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

=begin
# Problem
Given a string, return a new string which collapses duplicate characters into a single character.

String#squeeze may not be used.
An empty string should return empty.
A single character should return a single character.

Input: string
Output: new string

# Examples
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

# Data Structures

# Algorithm
Given a string
Initialize an empty string 'result'
Iterate through string characters
  if result[-1] == char
    next
  else
    result << char
  end
Output result

=end
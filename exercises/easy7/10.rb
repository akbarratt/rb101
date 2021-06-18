def penultimate(string)
  string.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'


# Further Exploration

def middle(string)
  return '' if string.size == 0
  words = string.delete('^a-zA-Z ').split
  if words.size.even?
    words[words.size/2 - 1] + ' ' + words[words.size/2]
  else
    words[words.size/2]
  end
end

p middle('the middle word') == 'middle'
p middle('Who Framed Roger Rabbit ?!') == 'Framed Roger'
p middle('one') == 'one'
p middle('') == ''

=begin
# Problem
Given a string, find and return the middle word of that string.

Input: String
Output: Substring

Potential edge cases: single word strings, strings with an even number of words, empty strings, strings that contain non-word substrings

Examples:
middle('the middle word') == 'middle'
middle('Who Framed Roger Rabbit ?!') == 'Framed Roger'
middle('one') == 'one'
middle('') == ''

# Algorithm
Given a string
Return '' if string.size == 0
Set a new variable words to string.delete('^a-zA-Z ').split
If words.size.even?
  words[words.size/2 - 1] + ' ' + words[words.size/2]
Else
  words[words.size/2]
=end

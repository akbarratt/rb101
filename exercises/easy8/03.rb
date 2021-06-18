def leading_substrings(string)
  results = []
  index = 0
  until index == string.size
    substring = string[0..index]
    results << substring
    index += 1
  end
  results
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

=begin
# Problem
Given a string, return all possible substrings that begin with the first letter of the given string.
Basically we're adding each character one at a time.
'abc' = 'a', 'ab', 'abc'

Input: String
Output: Array

# Examples
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# Data structures
Array

# Algorithm
Given a string
Initiate empty array result
Initiate variable index at 0
Iterate over the string starting at string[0..index], adding each to the results array.
Return array
=end

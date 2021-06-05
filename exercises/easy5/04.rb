def swap(string)
  split = string.split.map(&:chars)
  split.map! do |subarray|
    first = subarray.shift
    last = subarray.pop
    subarray.append(first)
    subarray.unshift(last)
    subarray.join
  end
  split.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# Further Exploration
def swap_first_last_characters(a, b)
  a, b = b, a
end
# swap_first_last_characters(word[0], word[-1])

abcde = 'Abcde'
p (abcde[0], abcde[-1] = swap_first_last_characters(abcde[0], abcde[-1]))
p abcde

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# The above code would not work because we're not actually passing in the whole word as parameter to the function, only the characters. In addition, a data structure like the one returned will return an array unless multiple assignment is used. So the following code WOULD work:
# word[0], word[-1] = swap_first_last_characters(word[0], word[-1])

=begin
# Problem
Given a string input, each word should have the first and last letter reversed and output the new string.

Input: String
Output: String

The method must be called "swap".
Assume each string contains at least one letter and that each string contains nothing but words and spaces.

# Examples
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

# Data structures
Array

# Algorithm
GIVEN a string of words separated by spaces
Initialize a new array assigned to the result of splitting the user input at the spaces
=> ["hello", "world"]
Iterating through the collection, furthur divide each collection item into a sub array of characters for each word
=> [["h","e","l","l","o"], ["w","o","r","l","d"]]
Iterating through each subarray, swap the positions of the items at index[0] and index[-1]
  first = array.shift!
  last = array.pop!
  array.append(first)
  array.unshift(last)
Join each subarray back together, then join the outer array, separated by spaces, and return the result.
=end



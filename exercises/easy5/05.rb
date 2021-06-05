=begin
# Problem
Given a string of letters and characters, return a string replacing all non-alphabetical characters with a space. Multiple characters in a row should be replaced by only a single string.

Input: String
Output: String

Will need a way to determine if multiple characters are present in sequence.

Will need to break down each string into its individual characters. Probably just a single array.

Will likely need a way to access the previous value. So a space should be inserted for 

Will likely need to treat existing spaces as a unique character. They can't simply be skipped because if followed by a special character, there should still only be one space. Maybe determine if previous character was a space?

No consecutive spaces

# Examples

cleanup("---what's my +*& line?") == ' what s my line '

# Data structures
Array

# Algorithm
GIVEN a string
Set a CONST of all alphabetical characters (upper and lowercase)
Split the string into an array of individual characters.
Initialize an empty string for results
Iterating through the array, determine if the current character is an alphabetical string.
  IF true, push to RESULT
  ELSE replace current iteration with ' '
    if result[-1] == ' '
      skip iteration
    else
      push ' ' to result
    end
  end
Return results string

=end

ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a

def cleanup(string)
  characters = string.split(//)
  result = ''
  characters.each do |char|
    if ALPHABET.include?(char)
      result << char
    else
      result << ' ' unless result[-1] == ' '
    end
  end
  result
end

p cleanup("---what's my +*& line?")

p cleanup("---what's my +*& line?") == ' what s my line '
def word_sizes(string)
  string.split.each_with_object({}) do |word, hash|
    if hash.has_key?(word.size)
      hash[word.size] += 1
    else
      hash[word.size] = 1
    end
  end
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

=begin
# Problem
Given a string consisting of words separated by spaces, in which a word consists of any string of characters that do not include a space, return a hash showing the number of words of different sizes.

Input: string
Output: hash

The key and value inside the hash should both be integers.
An empy string should return an empty hash.
Punctuation counts as part of the "word"; only space separations matter.

# Examples
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

# Data structures
Array
Hash

# Algorithm
GIVEN a string consisiting of words separated by characters (with each word being make up of a string of characters uninterrupted by a space)
Split the string at the spaces into an array of words
Iterate through the array using each with object ({})
  IF hash.has_key?(word.length)
    hash[:word.length] += 1
  ELSE
    hash[:word.length] = 1
  END
END

=end

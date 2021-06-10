VOWELS = 'aeiouAEIOU'

def remove_vowels(array)
  array.map do |word|
    word.delete(VOWELS)
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

=begin
# Problem
Given an array of strings, return a transformed array with the vowels removed

Upper and lowercase vowels must be removed

Input: Array
Output: Array

# Examples
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# Data structures
Array

# Algorithm
GIVEN an array of strings
Initalize a constant VOWELS = 'aeiuoAEIOU'
Iterate through the collection
  Delete the vowels
  Return the transformed string
Output the final array
=end
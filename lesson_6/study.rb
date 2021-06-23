=begin
A palindrome is a word, phrase, number, or other sequence of characters which reads the same backward as forward. Examples of numerical palindromes are:

2332 
110011 
54322345

You'll be given 2 numbers as arguments: (num, s). Write a method which returns an array of s number of numerical palindromes that come after num. If num is a palindrome itself, it should be included in the count. 

Return "Not valid" instead if any one of the inputs is not an integer or is less than 0.

# PROBLEM
Input: 2 numbers
Output: array, string - "Not valid"
Rules:
- definition of palindrome - needs to read the same backwards and forwards
- palindrome should be included if first argument is already a palindrome
- input has to be an integer or be greater than or equal to 0, otherwise return "Not valid"
- second argument represents the size of our return array

Questions:
- will inputs only consist of integers?

# EXAMPLES
p palindrome(6,4) == [11,22,33,44]
p palindrome(75,1) == [77]
p palindrome(101,2) == [101,111]
p palindrome(20,0) == []
p palindrome(0,4) == [11,22,33,44]
p palindrome("ACCDDCCA",3) == "Not valid"
p palindrome(773,"1551") == "Not valid"
p palindrome(-4505,15) == "Not valid"
p palindrome(4505,-15) == "Not valid"

- single digit numbers are not palindromes
- if second argument is 0, return empty array
- any arguments not integer, return "not valid"
- if arguments < 0, return "not valid"

# DATA STRUCTURES
Input: 2 integers
Output: array or string ("Not valid")
Intermediate: array, boolean, integer

# ALGORITHM
Given 2 integers, starting number and size
Determine whether both starting number and size are >= 0 and integer
  If false for either
    Return the string "Not valid"
  Else
    Initialize an empty array results
    Set the variable current number equal to starting_num
    Until the size of the array results is equal to the given size
      Determine whether current number is a palindrome
        Convert the integer into a string
        If the string read the same as the reverse, it is a palindrome
      If current number is a palindrome
        Push current number to results array
        Increment the current number by 1
      Else
        Increment the current number by 1
    Return the results array

Did not account for single numbers not being valid palindromes.

Used Ruby specific syntax (maybe).
=end


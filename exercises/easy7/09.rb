def multiply_all_pairs(arr1, arr2)
  results = []
  arr1.each do |int1|
    arr2.each do |int2|
      results << int1 * int2
    end
  end
  results.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

=begin
# Problem
Given 2 arrays of integeres containing 1 or more integers, return an array consisting of the product of every pair of numbers that can be formed between the elements of the two arrays. This array should be sorted by size.

This means for each integer in array 1 there should be a product for every integer in array 2, but not the other integers in array1.

Input: 2 arrays
Output: 1 array

# Example:
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# Data structures
Array

# Algorithm
GIVEN 2 arrays of 1 or more integers
Initialize a variable results = []
For each element of arr1
  Multiply current array by each array in arr2
  Push each product to results
Return results sorted
=end
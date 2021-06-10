=begin
# Problem
Given an array, return a nested array consisting of the two halves of the original array.

Input: array
Output: multidimensional array with 2 elements

Criteria: 
Odd arrays should give the extra element to the first nested array
Empty arrays should return an array of two empty arrays
Arrays of one object should return an array of one array with one element and one empty array

# Examples
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

# Data structure
Arrays

# Algorithm
Initialize an empty nested array result = [[],[]]
Determine input_array.length
  if odd? (because of how integer division works, we have to determine this; 5/2 = 2, not 3)
    1st half index = array[0] - array[array.length/2 + 1]
    2nd half index = array[array.length - array/2] - array[array.length]
  else
    1st half
=end
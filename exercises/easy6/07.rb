def determine_half(array)
  if array.length.odd?
    array.length/2
  else
    (array.length/2) - 1
  end
end

def halvsies(array)
  result = [[],[]]
  first_half = array[0..determine_half(array)]
  second_half = array[(determine_half(array) + 1)..array.length-1]
  result[0].replace(first_half)
  result[1].replace(second_half)
  result
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

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
    1st half = array[0] - array[array.length/2 - 1]
    2nd half = array[array.length/2] - array[array.length]
  end
  The problem with the previous line is zero indexing. This is becoming very cumbersome.
  Result[0].replace(1st half)
  Result[1].replace(2nd half)
  Return result

  Might we use Enumerable#partition for this?
=end

# Further exploration:
# Dividing by 2.0 will return a float, and calling Float#ceil will result in an integer. To get 5/2 = 3, we need to return 5/2.0 = 2.5.ceil = 3.
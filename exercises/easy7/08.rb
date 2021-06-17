# def multiply_list(arr1, arr2)
#   index = 0
#   result = []
#   until index == arr1.size
#     result << arr1[index] * arr2[index]
#     index += 1
#   end
#   result
# end

# Further exploration
def multiply_list(arr1, arr2)
  arr1.zip(arr2).map {|subarray| subarray.inject(:*)}
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

=begin
Given 2 arrays of equal size, return an array consisting of the product of each pair of arrays of the same index number from each given array.

Input: 2 arrays
Output: 1 array

Example:
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Data Structures
Array

# Algorithm
Given 2 arrays of equal length
Set a counter to 0
Set a result variable to an empty array
Until counter == result.length
  result << arr[counter] * arr2[counter]
  counter +=1
Return result.
=end

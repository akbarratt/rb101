def interleave (arr1, arr2)
  counter = 0
  result = []
  until counter == arr1.size && counter == arr2.size
    result << arr1[counter]
    result << arr2[counter]
    counter += 1
  end
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Further Exploration
# def interleave(arr1, arr2)
#   arr1.zip(arr2).flatten
# end

=begin
# Problem
Given 2 arrays, return a new array consisting of the first item in a, alternating with the first item in b, and so forth. Assume the arrays have the same number of elements and are not empty.

# Example
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Data Strutures
Array

# Algorithm
Given 2 arrays a and b
Set a counter to 0.
Set a result to []
Until counter == a.length && b.length
  result << a[counter]
  result << b[counter]
Return result
=end
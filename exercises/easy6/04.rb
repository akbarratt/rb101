def reverse!(array)
  array.replace(
    array.each_with_object([]) {|item, new_object| new_object.prepend(item)}
  )
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true

=begin
# Problem
Given an array of any object, reverse the placing of its elements without using Array#reverse or Array#reverse!, mutating the original array and returning the same object.

Input: array
Output: array

Should return an empty array if given an empty array. Single item arrays should be effectively unchanged.

Thought about using <=> but that won't work on arrays containing more than one object type. However, perhaps it can be used on the index numbers themselves?

# Examples
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true

# Data structures:
Array

# Algorithm
Given an array of objects
Iterate through the array with its index number
 Push each object with its index number to a new array
 Return the new array

=end
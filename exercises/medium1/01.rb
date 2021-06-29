require 'pry'

=begin
Write a method that rotates an array by moving the first element to the end of the array. 

The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

problem
- move first element to the end of the array
- not destructive
- cant .rotate


Examples

Data Stuctures
Input: array
Output: array

Algorithm
- pass array to method
- initialize a new array to be returned
- add everything except index[0]
index[0] + 1 until array.length
- add index 0 to the end
- return the array

=end
def is_array?(inp_object)
  #Check if data is an array
return true if inp_object.is_a?(Array)
false
end

def is_string?(inp_object)
#return true if object == string
return true if inp_object.is_a?(String)
false
end

def integer_rotator(inp_object)
  arr = []
  string = inp_object.to_s
  string.each_char{|x| arr << x }
  arr << string.chars[0]
  arr.delete_at(0)
  arr.join.to_i
end

def remove_first_in_data(data)
  # binding.pry
  arr = []
  if is_array?(data)
    data.each do |x| 
      arr << x if x != data[0]
    end
    return arr

  elsif is_string?(data)
  data.each_char do |x| 
    arr << x if x != data[0]
  end
  return arr

  elsif data.integer?
    arr = integer_rotator(data)
    return arr
  end
end

def rotate_array(array)
  arr = remove_first_in_data(array)
  arr << array[0]
end

def rotate_integer(int)
  arr = remove_first_in_data(int)
  
end

array1 = [5, 2, 3, 9]
p rotate_array(array1)

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true
p rotate_array('Hello!')
p rotate_integer(1234)
=begin
Write a method that rotates a string instead of an array.
Do the same thing for integers. You may use rotate_array from inside your new method.
# Problem

=end

# 1234.digits
# => [4, 3, 2, 1]

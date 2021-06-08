NUMBERS = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

NUM_HASH = {0=>"zero", 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six", 7=>"seven", 8=>"eight", 9=>"nine", 10=>"ten", 11=>"eleven", 12=>"twelve", 13=>"thirteen", 14=>"fourteen", 15=>"fifteen", 16=>"sixteen", 17=>"seventeen", 18=>"eighteen", 19=>"nineteen"}

# def alphabetic_number_sort(range_array)
#   range_array.sort_by { |int| NUM_HASH[int] }
# end

# Further exploration

def alphabetic_number_sort(range_array)
  range_array.sort { |a, b| NUM_HASH[a] <=> NUM_HASH[b] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

=begin
# Problem
Given an array of integers from 0 to 19, return a new array with those integers arranged in alphabetical order according to the English words for those integers.

Integers in array need to be >=0 && <=19

Input: array
Output: array

# Examples
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# Data Structures
Array
Hash

# Algorithm
GIVEN an array of integers
Loop through the array

=end
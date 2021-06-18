=begin
# Problem
Given an array of 1 or more integers, return the result of a sum of sums. Starting with the first integer by itself, add that to the sum of the integer plus the next number, and so on.

# Examples
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35

# Data Structures
Array
Range?

# Algorithm
Given an array of integers
Sums = []
[[3]]
[[3], [3, 5]]
[[3], [3, 5], [3, 5, 2]]
index = 0
Until index == array.size
  sums << array[0..index]
  index += 1

=end

def sum_of_sums(array)
  sums = []
  index = 0
  until index == array.size
    sums << array[0..index]
    index += 1
  end
  sums.map{|subarray| subarray.sum}.sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
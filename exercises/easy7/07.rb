def show_multiplicative_average(array)
  product = array.reduce(:*)
  quotient = product / array.size.to_f
  puts "The result is #{format('%.3f', quotient)}"
end

show_multiplicative_average([3, 5]) # => The result is 7.500
show_multiplicative_average([6]) # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# Further Exploration
# .to_f cannot be ommitted from the solution because integer division will always return an integer rounded down when the result would otherwise have included a decimal. While the final line would still format the resultant integer as a float to 3 decimal points, it would not produce the desired output unless the dividend and/or divisor were first converted to a float prior to the division operation.

=begin
Given a non-empty array of integers, multiply all integers together, divide by the number of integers in the array, then return the result rounded to 3 decimal places.

Input: Array
Output: Float

The best place to use the float seems to be in the division step. We definitely need to do float division here. Will also need to use format.

# Examples
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# Data structures
Array

# Algorithm

Iterate through the array, multiplying each item by each other item until a result integer is returned.
Divide this result by the number of items in Array, converted to float.
Return the resulting float.
=end

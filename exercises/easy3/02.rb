puts "==> Enter the first number:"
num1 = gets.chomp.to_i
puts "==> Enter the second number:"
num2 = gets.chomp.to_i
puts "==> #{num1} + #{num2} = #{num1 + num2}"
puts "==> #{num1} - #{num2} = #{num1 - num2}"
puts "==> #{num1} * #{num2} = #{num1 * num2}"
puts "==> #{num1} / #{num2} = #{num1 / num2}"
puts "==> #{num1} % #{num2} = #{num1 % num2}"
puts "==> #{num1} ** #{num2} = #{num1 ** num2}"

# Discussion: There are some edge cases to consider in this exercise. We have to be careful of not having a second number that is zero. What if we wanted to use floats instead of integers? How does this change this problem?

# Any equation using a float will return a float. If we wanted to accept both floats and integers, the user input would need to be validated. Currently we call String#to_i on user input, so any float would be converted into an integer.
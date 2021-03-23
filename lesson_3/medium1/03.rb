def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(-10)

# Bonus 1: Using % 0, we ensure that we only return factors that result in a whole number.
# Bonus 2: The purpose of line 8 is to return the entire array rather than just that last value added to the array as the implicit return value.
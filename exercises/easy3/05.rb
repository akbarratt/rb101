def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

# Further Exploration: What if we wanted to generalize this method to a "power to the n" type method: cubed, to the 4th power, to the 5th, etc. How would we go about doing so while still using the multiply method?

def power(num, power)
  multiply(num, 1)**power
end

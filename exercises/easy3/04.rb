def multiply(num1, num2)
  num1 * num2
end

multiply(5, 3) == 15
p multiply([1,2,3], 2)

# The reason Arrays behave differently in this method is that Array#* is a different operator from Integer#* and therefore behaves differently.
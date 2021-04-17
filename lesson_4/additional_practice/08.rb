numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# 1
# 3

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# 1
# 2

# Essentially, .each has a built in counter by which it moves to the next index number in Array. But this index number is applied to the modified Array. Really the only indices being checked in these programs are 0 and 1.
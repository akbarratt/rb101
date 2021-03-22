numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# 1
# 2
# 2
# 3
# Array#uniq returns a new array, it does not mutate the caller. Puts also automatically calls to_s on all output.
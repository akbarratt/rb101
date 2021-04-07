my_numbers = [1, 4, 3, 7, 2, 6]

# def double_numbers(array)
#   counter = 0
#   output = []

#   loop do
#     break if output.size == array.size
#     output << array[counter] * 2
#     counter += 1
#   end
#   p output
# end

# def double_numbers!(array)
#   counter = 0
#   loop do
#     break if counter == array.size
#     array[counter] *= 2
#     counter += 1
#   end
#   p array
# end

# double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]
# p my_numbers
# double_numbers!(my_numbers)
# p my_numbers

# def double_odd_numbers(array)
#   counter = 0
#   new_array = []
  
#   loop do
#     break if counter == array.size
#     if array[counter].odd?
#       new_array << array[counter] * 2
#     else
#       new_array << array[counter]
#     end
#     counter += 1
#   end
#   p new_array
# end

# def double_odd_index(array)
#   counter = 0
#   new_array = []
  
#   loop do
#     break if counter == array.size
#     if counter.odd?
#       new_array << array[counter] * 2
#     else
#       new_array << array[counter]
#     end
#     counter += 1
#   end
#   p new_array
# end


# double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]
# p my_numbers                      # => [1, 4, 3, 7, 2, 6]
# double_odd_index(my_numbers)  # => [2, 4, 6, 14, 2, 6]
# p my_numbers                      # => [1, 4, 3, 7, 2, 6]

def multiply(array, int)
  counter = 0
  output = []

  loop do
    break if output.size == array.size
    output << array[counter] * int
    counter += 1
  end
  p output
end

multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
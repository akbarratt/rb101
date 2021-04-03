numbers = [7, 9, 13, 25, 18]

# until numbers.length == 0
#   puts numbers.shift
# end

count = 0

until count == numbers.length
  puts numbers[count]
  count +=1
end
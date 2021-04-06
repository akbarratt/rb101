def create_array(integer)
  array = 
end

def parse_operator(string, range)
 if string == 's'
  for x in range
 elsif string == 'm'
 else
  puts "Error! Invalid operator."
 end
end

puts ">> Please enter an integer greater than 0:"
number = gets.chomp.to_i
puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operator = gets.chomp

puts "The sum of the integers between 1 and 5 is 15."
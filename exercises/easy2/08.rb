# def calculate (operator, int)
#   if operator == 's'
#     sum = 0
#     1.upto(int) { |num| sum += num}
#     sum
#   elsif operator == 'p'
#     product = 1
#     1.upto(int) { |num| product *= num }
#     product
#   else
#     puts 'Error!'
#   end
# end

# Further Exploration

def calculate (operator, int)
  if operator == 's'
    1.upto(int).inject(:+)
  elsif operator == 'p'
    1.upto(int).inject(:*)
  else
    puts 'Error!'
  end
end

puts ">> Please enter an integer greater than 0:"
number = gets.chomp.to_i
puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operator = gets.chomp

calculate(operator, number)

puts "The sum of the integers between 1 and #{number} is #{calculate(operator, number)}."


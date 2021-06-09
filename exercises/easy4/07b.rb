=begin
# Problem 
Given a string, convert this to an integer without using to_i or to_s. Do not worry about leading + or -.

Input: string
Output: integer

One issue is that there is no concatenation for integers. Therefore math has to be used to determine place value.

# Examples
string_to_integer('4321') == 4321
string_to_integer('570') == 570

# Data Structure
Array?

# Algorithm
GIVEN a string consisting of characters 0-9
Initialize a counter 1
Split the string into an array of characters.
Reverse the array and iterate through it with an accumulator(0)
  On each iteration, add to the accumulator the result of Numers[number] * counter
  Multiply counter by 10

=end

# NUMBERS = ('0'..'9').zip(0..9).to_h
# def string_to_integer(string)
#   tens = 1
#   string.split(//).reverse.inject(0) do |accumulator, num|
#     accumulator += (NUMBERS[num] * tens)
#     tens *= 10
#   end
# end

NUMBERS = ('0'..'9').zip(0..9).to_h
def string_to_integer(string)
  tens = 1
  result = 0
  string.split(//).reverse.each do |num|
    result += (NUMBERS[num] * tens)
    tens *= 10
  end
  result
end

p string_to_integer('4321')
p string_to_integer('570')
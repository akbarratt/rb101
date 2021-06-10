NUMBERS = (0..9).zip('0'..'9').to_h

def integer_to_string(integer)
  digits = []
  until integer <= 9
    digits.unshift(integer % 10)
    integer /= 10
  end
  digits.unshift(integer)
  digits.map {|num| NUMBERS[num]}
  digits.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

=begin
# Problem
Given an integer >= 0, return a string representation of that number without using to_s, String(), or Kernel#format.

Input: Integer
Output: String

# Examples

integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

# Data structures

# Algorithm
GIVEN a positive integer or 0
Initialize empty array digits
Until Integer <= 9
  Digits << Integer % 10
  Integer /= 10
Ex [4, 3, 2, 1]
Then map digits to the hash

=end


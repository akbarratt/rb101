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

def signed_integer_to_string(integer)
  absolute = integer_to_string(integer.abs)
  if integer.positive?
    absolute.prepend('+')
  elsif integer.negative?
    absolute.prepend('-')
  else
    absolute
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

=begin
# Problem
Given an integer, either preceded by a negative sign or not, return a string preceded by a + or -, unless that number is 0.

Input: integer
Output: string

Positive integers should be prefixed with + and negative with - but 0 should have neither.

# Examples

=end
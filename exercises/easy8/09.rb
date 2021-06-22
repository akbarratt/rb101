def reversed_number(number)
  digits = []
  loop do
    number, remainder = number.divmod(10)
    digits.prepend(remainder)
    break if number == 0
  end
  reverse_number = 0
  index = 0
  tens = 1
  until index == digits.size
    reverse_number += digits[index] * tens
    index += 1
    tens *= 10
  end
  reverse_number
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

=begin
# Problem
Given a positive integer, return an integer with the digits reversed.


=end
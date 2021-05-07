require 'pry'

NUMBERS = ('0'..'9').zip(0..9).to_h

def string_to_signed_integer(string)
  if string.first == '-' || digits.first == '+'
    sign = digits.shift
  else
    sign = '+'
  end
  digits = string.chars.map { |char| char = NUMBERS[char] }
  digits.reverse!
  result = 0
  tens = 1
  digits.each do |num|
    result += num * tens
    tens *= 10
  end
  return -result if sign == '-'
  result
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
NUMBERS = ('0'..'9').zip(0..9).to_h
def string_to_integer(array)
  tens = 1
  result = 0
  array.each do |num|
    result += (NUMBERS[num] * tens)
    tens *= 10
  end
  result
end

def string_to_signed_integer(string)
  array = string.chars.reverse
  if array.last == '+'
    array.pop
    string_to_integer(array)
  elsif array.last == '-'
    array.pop
    -string_to_integer(array)
  else
    string_to_integer(array)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
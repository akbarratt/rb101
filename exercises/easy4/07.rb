NUMBERS = ('0'..'9').zip(0..9).to_h

def string_to_integer(string)
  digits = string.chars.map { |char| NUMBERS[char] }
  digits.reverse!
  result = 0
  tens = 1
  digits.each do |num|
    result += num * tens
    tens *= 10
  end
  result
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# Further Exploration

HEX = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
}

def hexadecimal_to_integer(string)
  digits = string.upcase.chars.map { |char| HEX[char] }
  digits.reverse!
  result = 0
  hex_place = 1
  digits.each do |num|
    result += num * hex_place
    hex_place *= 16
  end
  result
end

p hexadecimal_to_integer('4D9f') == 19871


# 0b prefix in Ruby indicates a binary literal.
# https://www.honeybadger.io/blog/bitwise-hacks-in-ruby/
# https://www.youtube.com/watch?v=t_kA5KQxByc
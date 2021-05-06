def string_to_integer(string)
  string.chars.join.to_i
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# Further Exploration

HEX = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
}

# 0b prefix in Ruby indicates a binary literal.

def hexadecimal_to_integer(string)

end

# https://www.honeybadger.io/blog/bitwise-hacks-in-ruby/
# https://www.youtube.com/watch?v=t_kA5KQxByc
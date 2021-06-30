# Refactoring from 01.rb
# I think the type should be detected within the method itself
# The detection methods are extraneous.

def rotate(data_structure)
  return rotate_array(data_structure) if data_structure.is_a?(Array)
  return rotate_string(data_structure) if data_structure.is_a?(String)
  return rotate_integer(data_structure) if data_structure.is_a?(Integer)
end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_string(string)
  chars = rotate_array(string.chars)
  chars.join
end

def rotate_integer(integer)
  digits = rotate_string(integer.to_s)
  digits.to_i
end

p rotate([5, 2, 3, 9])
p rotate('Hello!')
p rotate(1234)

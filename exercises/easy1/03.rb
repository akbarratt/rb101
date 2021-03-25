def digit_list(int)
  array = int.to_s.split("")
  array = array.map { |n| n.to_i }
  return array
end

# This isn't working as expected. Needed to use .map instead of .each

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
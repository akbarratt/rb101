puts "the value of 40 + 2 is #{(40 + 2)}"
puts "the value of 40 + 2 is " + (40 + 2).to_s

# This will give a type error because a string and number cannot be concatenated.
# One solution is to append .to_s to the sum. The second is to use string interpolation.
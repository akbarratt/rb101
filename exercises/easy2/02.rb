=begin
SQMETERS_TO_SQFEET = 10.7639

def square_meters_conversion(length, width)
  (length * width).to_f
end

def square_foot_conversion(square_meters)
  (square_meters * SQMETERS_TO_SQQFEET).round(2)
end

puts "Enter the length of the room in meters:"
length = gets.chomp.to_i
puts "Enter the width of the room in meters:"
width = gets.chomp.to_i
square_meters = square_meters_conversion(length, width)
square_feet = square_foot_conversion(square_meters)
puts "The area of the room is #{square_meters} square meters (#{square_feet} square feet)."
=end

# Further Exploration

SQINCH_TO_SQCENT = 6.4516

def square_feet_conversion(length, width)
  (length * width).to_f
end

def square_inches_conversion(length, width)
  ((length * 12) * (width * 12)).to_f
end

def square_centimeter_conversion(square_inches)
  (square_inches * SQINCH_TO_SQCENT).round(2)
end

puts "Enter the length of the room in feet:"
length = gets.chomp.to_i
puts "Enter the width of the room in feet:"
width = gets.chomp.to_i
square_feet = square_feet_conversion(length, width)
square_inches = square_inches_conversion(length, width)
square_centimeters = square_centimeter_conversion(square_inches)
puts "The area of the room is #{square_feet} square feet and #{square_inches} square inches (#{square_centimeters} square centimeters)."
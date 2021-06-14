def triangle(integer)
  triangle = []
  until triangle.length == integer
    spaces = triangle.length
    stars = integer - spaces
    triangle << " " * spaces + "*" * stars
  end
  puts triangle.reverse
end

triangle(5)
triangle(9)

=begin
Given an integer, generate a graphical triangle (made of asterisks) with a base and height the same as the given integer. The heighest point should be on the top right side.

I'm thinking this should output an array that has rows with a certain number of spaces and asterisks. Perhaps starting with the most and then ending with one.

Input: integer
Output: array?

# Examples
See exercise

# Data structures
Array

# Algorithm
GIVEN an integer
Initialize empty array triangle
Until triangle.length > integer
  triangle << " " * triangle.length + "*" * integer - triangle.length
puts triangle.reverse
=end
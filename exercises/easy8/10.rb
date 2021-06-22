def center_of(string)
  middle_index = string.size/2
  if string.chars.size.odd?
    string.chars[middle_index]
  else
    string.chars[middle_index-1..middle_index].join
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'

=begin
Given a string, return the middle 1 or 2 characters from the string.

First, break the string down into an array of its characters
  If the size is odd
    return the character in the string that has the index of length/2
  If the size is even
    return the character that has the index of length/2 and the next character
=end
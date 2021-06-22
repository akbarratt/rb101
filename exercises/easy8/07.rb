def repeater(string)
  result = ''
  string.chars.each {|char| result << char * 2}
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

=begin
Convert string into an array of strings
Push character * 2 to empty string and return
=end
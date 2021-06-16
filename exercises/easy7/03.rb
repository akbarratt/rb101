# def word_cap(string)
#   result = string.split.map do |word|
#     word.capitalize
#   end
#   result.join(' ')
# end

UPCASE_CONVERT = ('a'..'z').to_a.zip('A'..'Z').to_h

def word_cap(string)
  result = string.split.map do |word|
    word[0] = UPCASE_CONVERT[word[0]] if UPCASE_CONVERT.has_key?(word[0])
      
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

=begin
# Problem
Solve the above problem without using String#capitalize

At the point where we run .map on string.split, we would need to change the string[0] value to its capital and all others would need to be changed to lowercase. All non-letter characters would need to be ignored.

Input: string
Output: string

# Algorithm
Initiate a CONST hash with lowercase keys and uppercase values
Iterate through string.split |word|
  Map word[0] to the CONST hash
  Then iterate through the rest of the characters, converting them to lower case.
  Implicitly return modified word
Return joined array as string
=end
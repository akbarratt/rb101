def staggered_case(string)
  result = ''
  string.chars.each_with_index do |char, index|
    if index.even?
      result << char.upcase
    else
      result << char.downcase
    end
  end
  result
end

# Further exploration

# def staggered_case(string, start_even = true)
#   result = ''
#   need_upper = start_even
#   string.chars.each do |char|
#     if need_upper
#       result += char.upcase
#     else
#       result += char.downcase
#     end
#     need_upper = !need_upper
#   end
#   result
# end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

=begin
# Problem
Given a string, return a new string consisting of the original string with every other letter capitalized and the rest lower-case.

Even indexed characters should be capitalized, odd should be lowercased. Non-alphabetical characters should be returned in their original forms.

Should disregard starting case.

# Examples
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Data Structures
Array

# Algorithm
Given a string
Iterate through an array of the string characters
  If the string index is even, capitalize
  If the string index is odd, lowercase
Return the joined string
=end

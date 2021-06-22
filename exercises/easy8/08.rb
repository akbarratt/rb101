CONSONANTS = (('a'..'z').to_a + ('A'..'Z').to_a).difference('aeiouAEIOU'.chars)

def double_consonants(string)
  result = ''
  string.chars.each do |char|
    if CONSONANTS.include?(char)
      result << char*2
    else
      result << char
    end
  end
  result
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

=begin
Input: string
Output: string

Split string into characters
Determine if each character is a consonant, if so double it
If not push once to result
=end
ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a

def staggered_case(string)
  result = ''
  capitalize = true
  string.chars.each_with_index do |char, index|
    if ALPHABET.include?(char)
      if capitalize == true
        result << char.upcase
      else
        result << char.downcase
      end
      capitalize = !capitalize
    else
      result << char
    end
  end
  result
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
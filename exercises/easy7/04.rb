UPCASE_CONVERT = ('a'..'z').to_a.zip('A'..'Z').to_h
DOWNCASE_CONVERT = ('A'..'Z').to_a.zip('a'..'z').to_h

def swapcase(string)
  result = string.chars.map do |char|
    if UPCASE_CONVERT.has_key?(char)
      UPCASE_CONVERT[char]
    elsif DOWNCASE_CONVERT.has_key?(char)
      DOWNCASE_CONVERT[char]
    else
      char
    end
  end
  result.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
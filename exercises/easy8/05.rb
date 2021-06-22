def leading_substrings(string)
  results = []
  index = 0
  until index == string.size
    substring = string[0..index]
    results << substring
    index += 1
  end
  results
end

def substrings(string)
  results = []
  string.chars.each_index do |index|
    results << leading_substrings(string[index..-1])
  end
  results.flatten
end

def palindromes(string)
  substrings(string).each_with_object([]) do |substring, palindromes|
    palindromes << if substring == substring.reverse
  end
end

# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
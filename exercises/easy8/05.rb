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
  palindromes = substrings(string).select do |substring|
    substring.size > 1 && substring == substring.reverse
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
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

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

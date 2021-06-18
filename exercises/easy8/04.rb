def leading_substrings(string)
  # results = []
  # index = 0
  # until index == string.size
  #   substring = string[0..index]
  #   results << substring
  #   index += 1
  # end
  # results
  p string.chars.combination.to_a
end

leading_substrings('abc')

=begin
# Problem
Given a string, return every possible substring of that string.

Can we use Array#permutation or similar here?

=end
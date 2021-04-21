def palindrome?(string)
  string == string.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
p palindrome?([1,2,3]) == false
p palindrome?([3,2,1,2,3]) == true

# String#reverse and Array#reverse act in a similar fashion. Because arrays are ordered, this one function can take either a string or array and return the expected result.
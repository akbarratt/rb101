ALPHANUMERICS = [("a".."z").to_a, ("A".."Z").to_a, (0..9).to_a].flatten

def transform(string)
  array = string.chars.delete_if { |char| !ALPHANUMERICS.include?(char)}
  array.join.downcase
end

def real_palindrome?(string)
  transform(string) == transform(string).reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
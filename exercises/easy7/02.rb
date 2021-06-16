UPCASE = ('A'..'Z').to_a
DOWNCASE = ('a'..'z').to_a

def letter_case_count(string)
  results = {lowercase: 0, uppercase: 0, neither: 0}
  string.chars.each do |char|
    if DOWNCASE.include?(char)
      results[:lowercase] += 1
    elsif UPCASE.include?(char)
      results[:uppercase] += 1
    else
      results[:neither] += 1
    end
  end
  results
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

=begin
# Problem
Given a string, return a hash representative of how many characters were upcase letters, how many were downcase, and how many were neither.

Input: string
Output: hash

A non-alphabetical string character will return the same character with upcase or downcase called on it.

The best approach seems to be to use one const for upcase characters and another for downcase rather than determining if each character is upcase or downcase.

# Examples
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Data Structures
Array
Hash

# Algorithm
Given a string
Set a const to all uppercase letters
Set another const to all lowercase letters
Set empty results hash (default 0)
On string.chars, iterate through each character
  If lowercase
    Hash[lowercase] += 1
  If uppercase
    hash[uppercase] += 1
  else
    neither += 1
  end
Return results
=end
statement = "The Flintstones Rock"

hash = {}
statement.each_char do |char|
  if hash[char]
    hash[char] += 1
  else
    hash[char] = 1
  end
end


p hash
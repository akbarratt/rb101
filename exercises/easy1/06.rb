def reverse_words(string)
  sentence = []
  array = string.split
  array.each do |word|
    if word.length >= 5
      sentence << word.reverse
    else
      sentence << word
    end
  end
  return sentence.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
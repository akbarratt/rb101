words = "the flintstones rock"

def titleize(string)
  array = string.split
  array.map do |word|
    word.capitalize!
  end
  array.join(' ')
end

words = titleize(words)

puts words
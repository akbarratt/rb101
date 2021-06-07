ALPHABET = ('a'..'z').to_a

def word_sizes(string)
  clean_words = string.split.map do |word|
    word.chars.keep_if { |char| ALPHABET.include?(char.downcase) }
  end
  clean_words.each_with_object({}) do |word, hash|
    if hash.has_key?(word.size)
      hash[word.size] += 1
    else
      hash[word.size] = 1
    end
  end
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
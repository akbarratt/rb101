def reverse_sentence(string)
  string.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

# Why didn't Array#each work here? It never returned the last 2 words.

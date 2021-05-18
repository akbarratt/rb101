VOWELS = ['a', 'e', 'i', 'o', 'u']

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, array|
  array.each do |string|
    string.chars.each do |char|
      puts char if VOWELS.include?(char)
    end
  end
end
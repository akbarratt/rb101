def select_vowels(str)
  selection = ''
  counter = 0

  loop do
    current_char = str[counter]
    if 'aeiouAEIOU'.include?(current_char)
      selection << current_char
    end

    counter += 1
    break if counter == str.size
  end
  puts selection
end

select_vowels('the quick brown fox')      # => "euioo"

sentence = 'I wandered lonely as a cloud'
select_vowels(sentence)                   # => "Iaeeoeaaou"

number_of_vowels = select_vowels('hello world').size
number_of_vowels # => 3
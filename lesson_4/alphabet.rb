alphabet = 'abcdefghijklmnopqrstuvwxyz'
counter = 0
selection = ''

loop do
  current_selection = alphabet[counter]

  if current_selection == 'g'
    selection << current_selection
  end

  counter += 1
  break if counter == alphabet.length
end

p selection
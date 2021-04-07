fruits = ['apple', 'banana', 'pear']
counter = 0
selection = []

loop do
  current_selection = fruits[counter]
  selection << current_selection + 's'

  counter += 1
  break if counter == fruits.size
end

p selection
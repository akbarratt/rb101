def general_select(hash, selection_criteria)
  selection = {}
  counter = 0
  array = hash.keys

  loop do
    current_key = array[counter]
    current_value = hash[current_key]
    if current_value == selection_criteria
      selection[current_key] = current_value
    end

    counter += 1
    break if counter == array.size
  end

  p selection
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

general_select(produce, 'Fruit')     # => {"apple"=>"Fruit", "pear"=>"Fruit"}
general_select(produce, 'Vegetable') # => {"carrot"=>"Vegetable", "broccoli"=>"Vegetable"}
general_select(produce, 'Meat')      # => {}

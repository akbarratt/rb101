vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(array)
  occurrences = {}
  array.each do |item|
    current_item = item
    if occurrences[current_item]
      occurrences[current_item] += 1
    else
      occurrences[current_item] = 1
    end
  end
  occurrences.each do { |k, v| puts "#{k} => #{v}" }
end

# Further exploration: Try to solve the problem when words are case insensitive, e.g. "suv" == "SUV". Better to use casecmp?

vehicles = [
  'car', 'CAR', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'Motorcycle', 'car', 'truck', 'suv'
]

def count_occurrences(array)
  occurrences = {}
  array.each do |item|
    current_item = item
    if occurrences[current_item.downcase]
      occurrences[current_item.downcase] += 1
    else
      occurrences[current_item.downcase] = 1
    end
  end
  occurrences.each do |k, v|
    puts "#{k} => #{v}"
  end
end


count_occurrences(vehicles)
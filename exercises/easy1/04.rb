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
  puts occurrences
end


count_occurrences(vehicles)
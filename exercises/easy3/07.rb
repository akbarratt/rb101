def oddities(ary)
  new_array = []
  ary.each_index do |index|
    new_array << ary[index] if index.even?
  end
  new_array
end

# Further exploration:

def oddities(ary)
  new_array = []
  for num in ary
    new_array << num if ary.index(num).even?
  end
  new_array
end

# This solution will not work for unordered arrays or arrays with repeated elements.

def oddities(ary)
  new_array = []
  counter = 0
  loop do
    break if counter == ary.size
    new_array << ary[counter] if counter.even?
    counter += 1
  end
  new_array
end


p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

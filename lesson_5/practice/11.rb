arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr2 = arr.map do |inner_array|
  inner_array.select do |num|
    num % 3 == 0
  end
end

p arr
p arr2
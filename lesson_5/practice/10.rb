arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# arr2 = arr.map do |inner_hash|
#   inner_hash.transform_values do |value|
#     value += 1
#   end
# end

# arr2 = arr.each_with_object([]) do |hash, array|
#   new_hash = {}
#   hash.each do |key, value|
#     new_hash[key] = value + 1
#   end
#   array << new_hash
# end

arr2 = arr.map do |inner_hash|
  new_hash = {}
  inner_hash.each do |key, value|
    new_hash[key] = value + 1
  end
  new_hash
end

p arr
p arr2
[1, 2, 3].reject do |num|
  puts num
end

# [1, 2, 3]
# Reject, to the contrary of count, only counts items that return true to the given block, and stores them into a new array.
# Because puts returns nil, all items will be saved, returning a new array that's identical to the original.
def reverse!(array)
  array.sort! { |e1, e2| array.index(e2) <=> array.index(e1) }
end

# list = [1,2,3,4]
# result = reverse!(list)
# p result == [4, 3, 2, 1] # true
# p list == [4, 3, 2, 1] # true
# p list.object_id == result.object_id # true

# list = %w(a b e d c)
# p reverse!(list) == ["c", "d", "e", "b", "a"] # true
# p list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# p reverse!(list) == ["abc"] # true
# p list == ["abc"] # true

# list = []
# p reverse!(list) == [] # true
# p list == [] # true

list = [11, '2', 1, '22', false, nil]
p list.object_id
p reverse!(list) == [nil, false, '2', 1, '22', 11] # true
p list == [11, '2', 1, '22', false, nil] # true
p list
p list.object_id
p reverse!(list)
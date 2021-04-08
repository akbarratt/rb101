[1, 2, 3].select do |num|
  num > 5
  'hi'
end

#['hi', 'hi', 'hi']
# Select performs selection based on the truthiness of the block's return value. Because the last expression in the box is the string 'hi', the block's return value is always true. Therefore all objects in the array are selected and included in the return array.
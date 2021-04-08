['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# 2
# By consulting the documentation, we can see that count is a method that returns the number of collection items that return true to the given block. If no argument is given, it gives the total number of collection items.
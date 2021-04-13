# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# |nil, bear|
# Map is an iterative method that transforms every object in a colletion. Because every item will be transformed, we can expect the return colleciton of map to be as long as the original collection. The nil value is returned because the value 'ant' did not meet the transformation criterion on line 4. Because the return value of .map is based on the return value of the block, nil is returned.
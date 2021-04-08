['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# ['ant', 'bear', 'cat']
# .each_with_object takes an object as an argument, and it is this object that is returned, based on the return value of the block, when the method resolves.
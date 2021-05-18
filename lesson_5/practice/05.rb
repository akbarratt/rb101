munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

p munsters.to_a[0][1]["age"]

# ages = munsters.values.inject do |sum, inner_array|
#   sum += inner_array[1]["age"] if inner_array[1]["gender"] == "male"
#   sum
# end

# p ages

# age = 0
# munsters.each do |inner_hash|
#   munsters.each do |name|
#    age += name["age"] if name["gender"] == "male"
#   end
# end
# p  name

# age = 0
# munsters.each_value do |inner_hash|
#   age += inner_hash["age"] if inner_hash["gender"] == "male"
# end

# p age

=begin
Thoughts: inject will apply the block to all elements of enum. For this reason I think it won't work on a hash. Or I'm just having trouble accessing the right elements. I think this is clear when you run:

munsters.inject do |sum, hash|
  puts hash
end

Also, inject converts the hash it's called on into an array. In this case I believe it would be an array of key-value pairs.

=end
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# munsters.inject do |sum, name|
#   sum += name["age"] if name["gender"] == "male"
# end

age = 0
munsters.each do |inner_hash|
  munsters.each do |name|
   age += name["age"] if name["gender"] == "male"
  end
end
p  name

# age = 0
# munsters.each_value do |inner_hash|
#   age += inner_hash["age"] if inner_hash["gender"] == "male"
# end

# p age
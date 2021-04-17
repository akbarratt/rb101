munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# p munsters["Herman"]["age"]

munsters.each_key do |name|
  age = munsters[name]["age"]
  case age
  when (0..17) then munsters[name]["age_group"] = "kid"
  when (18..64) then munsters[name]["age_group"] = "adult"
  else munsters[name]["age_group"] = "senior"
  end
end

puts munsters
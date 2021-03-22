advice = "Few things in life are as important as house training your pet dinosaur."

# split = advice.split(' ')
# split[6] = "urgent"
# advice = split.join(" ")
# puts advice

advice.gsub!('important', 'urgent')
puts advice
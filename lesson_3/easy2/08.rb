advice = "Few things in life are as important as house training your pet dinosaur."
# advice.slice!("Few things in life are as important as ")
p advice.slice!(0, advice.index('house'))
p advice
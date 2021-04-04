CURRENT_YEAR = Time.now.year

def years_left(current, retirement)
  retirement - current
end

def future_year(current_year, years_remaining)
  current_year + years_remaining
end

print "What is your age? "
current_age = gets.chomp.to_i
print "At what age would you like to retire? "
retirement_age = gets.chomp.to_i

years = years_left(current_age, retirement_age)
future = future_year(CURRENT_YEAR, years)

puts "It's #{CURRENT_YEAR}. You will retire in #{future}."
puts "You have only #{years} years of work to go!"
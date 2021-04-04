def name_age
  random_number = rand(20..200)
  puts "What's your name?"
  name = gets.chomp
  name = "Teddy" if name == ''
  puts "#{name} is #{random_number} years old!"
end

name_age
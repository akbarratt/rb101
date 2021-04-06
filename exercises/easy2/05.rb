def response(string)
  if string.chars.last == "!"
    puts "HELLO #{string[0..-2].upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{string}."
  end
end

print "What is your name? "
name = gets.chomp

response(name)

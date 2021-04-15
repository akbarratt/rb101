flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.select do |name|
  flintstones.index(name) if name.start_with?("Be")
end
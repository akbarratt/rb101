def repeat(str, int)
  int.times {puts "#{str}"}
end

repeat("Hello there", 3)

# .times takes a block, not a parameter
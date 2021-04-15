flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash = {}
flintstones.each_with_index do |object, index|
  hash[object] = index
end

p hash

# Is there a way to do this with to_h?
# p flintstones.to_h { |value| [value, flintstones.index("value")] }

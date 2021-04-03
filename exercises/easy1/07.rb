def stringy(int, option = 1)
  output = []
  if option == 1
    until output.length == int
      if output.last == 1
        output << 0
      else
        output << 1
      end
    end
  elsif option == 0
    until output.length == int
      if output.last == 0
        output << 1
      else
        output << 0
      end
    end
  else
    puts "Error, incorrect parameter!"
  end
  output.join
end


puts stringy(6) == '101010'
puts stringy(6, 0) == '010101'
puts stringy(9) == '101010101'
puts stringy(9, 0) == '010101010'
puts stringy(4) == '1010'
puts stringy(4, 0) == '0101'
puts stringy(7) == '1010101'
puts stringy(7, 0) == '0101010'

=begin
Further Exploration

Modify stringy so it takes an additional optional argument that defaults to 1. If the method is called with this argument set to 0, the method should return a String of alternating 0s and 1s, but starting with 0 instead of 1.
=end

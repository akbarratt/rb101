# def is_odd?(int)
#   if int == 0
#     return false
#   elsif (int%2 == 0)
#     return false
#   else
#     return true
#   end
# end

def is_odd?(int)
  int % 2 == 1
end

# Further exploration

ODD = [1,3,5,7,9]

def is_odd?(int)
  if ODD.include?(int.abs.digits.last)
    return true
  else
    return false
  end
end

# I think digits reorders the digits however.

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
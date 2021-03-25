def is_odd?(num)
  if num % 2 == 1
    true
  else
    false
  end
end

# Further exploration: rewrite without modulo or remainder

ODD = [1,3,5,7,9]

def is_odd?(int)
  if ODD.include?(int.abs.digits.last)
    return true
  else
    return false
  end
end

# I think digits reorders the digits however.

# Further exploration: rewrite with Integer#remainder

def is_odd?(num)
  if num == 0 ||num.remainder(2) == 0
    false
  else
    true
  end
end


puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

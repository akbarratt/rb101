def xor?(exp1, exp2)
  if exp1 == true && exp2 == true
    return false
  elsif exp1 == false && exp2 == false
    return false
  else
    return true
  end
end

p xor?(5.even?, 4.even?) == true # false, true
p xor?(5.odd?, 4.odd?) == true # true, false
p xor?(5.odd?, 4.even?) == false # true, true
p xor?(5.even?, 4.odd?) == false # falase, false

# Short circuit evaluation would not make sense for xor operations because it requires both expressions to be evaluated.
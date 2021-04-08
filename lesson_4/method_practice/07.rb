[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# 1
# => true

# The block's return value would be true because num.odd? is the last statement evaluated.
# The return value of .any? would be true, because it returns true when any of the block's evaluated results return true.
# In fact, .any? stops after the first iteration because it uses short-circuit evaluation to return true after the first true value it encounters. Therefore only the first loop runs and only 1 gets printed.
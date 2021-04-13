# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 0
    puts num
  else
    num
  end
end

# [1, nil, nil]
# Once again, the transformative result of the .map method is based on the return value of the block. Because the latter 2 elements in the array are > 1, line 5 will be executed on each iteration. The return value of puts is always nil, therefore the new, transformed array will contain two nil objects.
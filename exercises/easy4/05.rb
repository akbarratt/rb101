# def multisum(num)
#   result = 0
#   1.upto(num) do |int|
#     result += int if int % 3 == 0 || int % 5 == 0
#   end
#   result
# end

def multisum(num)
  (1..num).select { |int| int % 3 == 0 || int % 5 == 0 }.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
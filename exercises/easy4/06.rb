# def running_total(array)
#   return array if array == []
#   result = [array[0]]
#   counter = 1
#   loop do
#     break if result.size == array.size
#     result << result[counter-1] + array[counter]
#     counter += 1
#   end
#   result
# end

# Further Exploration

# def running_total(array)
#   sum = 0
#   array.each_with_object([]) do |item, ary|
#     ary << item + sum
#     sum = item + sum
#   end
# end

def running_total(array)
  # sum = 0
  array.inject([]) do |result, item|
    result << result += item
  end
end

p running_total([2, 5, 13])

# p running_total([2, 5, 13]) == [2, 7, 20]
# p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# p running_total([3]) == [3]
# p running_total([]) == []
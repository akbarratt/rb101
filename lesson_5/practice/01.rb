arr = ['10', '11', '9', '7', '8']

arr.map(&:to_i).sort.reverse.map(&:to_s)
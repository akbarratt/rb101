brd = {1 => '1', 2 => '2', 3 => '3', 4=> '4', 5=> '5', 6 => '6', 7 => '7', 8 => '8', 9=> '9'}
# line = [1, 2, 3]

# def square_threatened?(brd, line)
#   !!defend_square(brd, line)
# end

# def defend_square(brd, line)
#   return brd.key(' ') if brd.values_at(1, 2, 3).count('X') == 2
#   nil
# end

# p square_threatened?(brd, line)
# p defend_square(brd, line)

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

WINNING_LINES.each do |line|
  p line
  p brd.values_at(*line)
end

WINNING_LINES.each do |line|
  p line
  p brd.values_at(line)
end
brd = {1 => 'X', 2 => 'X', 3 => ' ', 4=> ' ', 5=> ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9=> ' '}
line = [1, 2, 3]

def square_threatened?(brd, line)
  !!defend_square(brd, line)
end

def defend_square(brd, line)
  return brd.key(' ') if brd.values_at(1, 2, 3).count('X') == 2
  nil
end

p square_threatened?(brd, line)
p defend_square(brd, line)
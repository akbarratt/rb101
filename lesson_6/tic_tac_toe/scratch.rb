line = {1 => 'X', 2 => 'X', 3 => ' '}

def square_threatened?(line)
  return true if line.values_at(1, 2, 3).count('X') == THREATENED_MARKERS
  false
end
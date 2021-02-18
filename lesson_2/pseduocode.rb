numbers = [12, 3, 91, 10, 4]

saved_number = 0

numbers.each do |number|
  current_number = number
  if saved_number >= current_number
    next
  else
    saved_number = current_number
  end
end

puts saved_number
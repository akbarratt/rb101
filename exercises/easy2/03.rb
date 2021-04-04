def calculate_tip(amount, percentage)
  (amount * (percentage/100)).round(2)
end

def calculate_total_bill(amount, tip)
  (amount + tip).round(2)
end

puts "What is the bill?"
bill = gets.chomp.to_f
puts "What is the tip percentage?"
tip_percent = gets.chomp.to_f
tip = calculate_tip(bill, tip_percent)
total = calculate_total_bill(bill, tip)

puts "The tip is $#{tip}"
puts "The total is $#{total}"
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_float?(input)
  input.to_f > 0 || input.to_i > 0
end

def valid_int?(input)
  input.to_i.to_s == input && input.to_i >= 0
end

def get_loan_amount
  loop do
    prompt("Enter your total loan amount:")
    input = gets.chomp
    return input.to_f if valid_float?(input)
    prompt("Please enter a valid number.")
  end
end

def get_apr
  loop do
    prompt("Enter your APR:")
    input = gets.chomp
    return input.to_f if valid_float?(input)
    prompt("Please enter a valid number.")
  end
end

def get_loan_years
  loop do
    prompt("Enter the number of years on your loan:")
    input = gets.chomp
    return input.to_i if valid_int?(input)
    prompt("Please enter a whole number.")
  end
end

def get_loan_months
  loop do
    prompt("Enter the number of months on your loan:")
    input = gets.chomp
    return input.to_i if valid_int?(input)
    prompt("Please enter a whole number.")
  end
end

def valid_timespan?(years, months)
  if years <= 0 && months <= 0
    false
  else
    true
  end
end

def get_timespan
  loop do
    loan_left_years = get_loan_years
    loan_left_months = get_loan_months
    if valid_timespan?(loan_left_years, loan_left_months)
      return loan_left_years, loan_left_months
    else
      prompt("Amount of time remaining on loan cannot be 0 years, 0 months.")
    end
  end
end

def convert_timespan(years, months)
  (years * 12) + months
end

def convert_apr(float)
  (float / 12).round(3)
end

def calculate_payment(total, mo_int, term)
  total * ((mo_int / 100) / (1 - (1 + (mo_int / 100))**(-term)))
end

def calculate_repayment(payment, term)
  payment * term
end

def calculate_total_interest(repayment, total)
  repayment - total
end

# Note: I implemented the following 2 methods simply for the readability of the code reviewer.
# I had to look up the regex, so it's not my original work.
# Assumed it was probably outside the scope of this lesson but let me know if that's incorrect.
def format_money(float)
  money = '%.2f' % float
  return money.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
end

def format_interest(float)
  '%.3f' % float
end

def repeat?
  loop do
    prompt("Do you want to perform another calculation? (Y/N)")
    answer = gets.chomp
    if answer.downcase == "yes" || answer.downcase == "y"
      return true # redundant returns?
    elsif answer.downcase == "no" || answer.downcase == "n"
      return false
    else
      prompt("Invalid response. Please enter 'yes' or 'no'.")
    end
  end
end

loop do # main loop
  system("clear")
  prompt("Welcome to the loan calculator!")
  total_loan_amount = get_loan_amount
  apr = get_apr
  loan_left_years, loan_left_months = get_timespan

  prompt("Calculating...")
  loan_term = convert_timespan(loan_left_years, loan_left_months)
  monthly_interest = convert_apr(apr)
  monthly_payment =
    calculate_payment(total_loan_amount, monthly_interest, loan_term)
  repayment_cost = calculate_repayment(monthly_payment, loan_term)
  total_interest = calculate_total_interest(repayment_cost, total_loan_amount)
  # Results
  results = <<-MSG
  On your loan of $#{format_money(total_loan_amount)} at #{format_interest(apr)}% APR over #{loan_left_years} year(s), #{loan_left_months} month(s):
  Number of payments: #{loan_term}
  Monthly payment: $#{format_money(monthly_payment)}
  Monthly interest rate: #{format_interest(monthly_interest)}%
  Total cost of repayment: $#{format_money(repayment_cost)}
  Total interest paid: $#{format_money(total_interest)}
  MSG
  prompt(results)

  break unless repeat?
end

prompt("Thank you for using the loan calculator!")

# Might have some variable shadowing with get_timespan.
# Refactoring as in notes above
# Total interest paid amount is sometimes slightly wrong? I assume this is some quirk of the formula and not the code. Or maybe how numbers work. Need to bug test.

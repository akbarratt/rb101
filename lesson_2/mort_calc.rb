def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_float?(input)
  input.to_f > 0 || input.to_i > 0
end

def valid_int?(input)
  input.to_i.to_s == input && input.to_i >= 0
end

def get_loan_amt
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
    return false
  else
    return true
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

def convert_timespan(array)
  (array[0] * 12) + array[1]
end

def convert_apr(float)
  (float / 12).round(3)
end

def calculate_payment

end

prompt("Welcome to the loan calculator!")

loop do
  total_loan_amt = get_loan_amt
  apr = get_apr
  timespan = get_timespan
  loan_left_years = timespan[0]
  loan_left_months = timespan[1]

  prompt("Calculating...")
  # Some variable names have changed below
  loan_term = convert_timespan(timespan)
  mo_int = convert_apr(apr)
  # Stopped here
  mo_payment =
    total_loan_amt.to_f *
    ((mo_int / 100) / (1 - (1 + (mo_int / 100))**(-loan_term)))
  repayment_cost = mo_payment * loan_term
  total_interest = repayment_cost - total_loan_amt.to_f
  # Results
  results = <<-MSG
  On your loan of $#{total_loan_amt} at #{apr}% APR over #{loan_left_years} year(s), #{loan_left_mo} month(s):
  Number of payments: #{loan_term}
  Monthly payment: $#{mo_payment.round(2)}
  Monthly interest rate: #{mo_int}%
  Total cost of repayment: $#{repayment_cost.round(2)}
  Total interest paid: $#{total_interest.round(2)}
  MSG
  prompt(results)

  prompt("Do you want to perform another calculation? (Y/N)")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the loan calculator!")

# Years left needs to allow for 0, but years and months shouldn't both be zero. Needs an additonal validation. Maybe a nested method?

# Not really sure when to convert input to ints/floats.
# How to solve scoping issue on loan amount? Make it an array?
# Might have some variable shadowing with get_timespan.


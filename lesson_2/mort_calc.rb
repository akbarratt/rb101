def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_float?(input)
  input.to_f > 0 || input.to_i > 0
end

def valid_int?(input)
  input.to_i.to_s == input && input.to_i >= 0
end

def valid_timespan?(years, months)
  if years <= 0 && months <= 0
    return false
  else
    return true
  end
end

def get_loan_amt
  loop do
    prompt("Enter your total loan amount:")
    input = gets.chomp
    # Right now this won't take any number less than 1.
    # Is this still true? Haven't evaluated.
    break if valid_float?(input)
    prompt("Please enter a valid number.")
  end
end

prompt("Welcome to the loan calculator!")

loop do
  total_loan_amt = get_loan_amt
  
  apr = ''
  loop do
    prompt("Enter your APR:")
    apr = gets.chomp
    if valid_float?(apr)
      break
    else
      prompt("Please enter a valid number.")
    end
  end

  loan_left_years = ''
  loop do
    prompt("Enter the number of years on your loan:")
    loan_left_years = gets.chomp
    if valid_int?(loan_left_years)
      break
    else
      prompt("Please enter a whole number.")
    end
  end

  loan_left_mo = ''
  loop do
    prompt("Enter the number of months on your loan:")
    loan_left_mo = gets.chomp
    if valid_int?(loan_left_mo)
      break
    else
      prompt("Please enter a whole number.")
    end
  end

  prompt("Calculating...")
  loan_term = (loan_left_years.to_i * 12) + loan_left_mo.to_i
  mo_int = (apr.to_f / 12).round(3)
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

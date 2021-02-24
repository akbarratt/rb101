=begin
START

WHILE continue = true
  GET total loan amount
  SET total_loan_amt = total loan amount
    IF total_loan_amt is valid float
      continue
    ELSE IF total_loan_amt is valid integer
      convert to float
    ELSE
      "Please enter a valid number"
  GET APR
  SET apr = APR
    IF apr is valid float
      continue
    ELSE IF total_loan_amt is valid integer
      convert to float
    ELSE
      "Please enter a valid number"
  GET years left on loan
  SET loan_left_yrs = years left on loan
    IF loan_left_years is valid integer
      continue
    ELSE
      "Please type a whole number"
  GET months left on loan
  SET loan_left_mo = months left on loan
    IF loan_left_mo is valid integer
      continue
    ELSE
      "Please type a whole number"
  SET loan_term = (loan_left_yrs * 12) + loan_left_mo
  SET mo_int = APR / 12
  SET mo_payment = loan_amt * (mo_int / (1 - (1 + mo_int)**(-loan_term)))

  PRINT mo_int
  PRINT loan_term [maybe combine this into one statement]
  PRINT mo_payment
  PRINT mo_payment / mo_int = amount of mo_payment that is interest.

  PRINT "Would you like to enter another loan?"
  GET continue = true/false
    IF continue = true || false
      next
    ELSE
      "please enter true or false"

PRINT "Thanks for using the calculator"
END

NOTES: need to keep decimal to 2 places
Not sure at which point to convert things to int/float?

=end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_float?(input)
  (input.to_f.to_s == input || input.to_i.to_s == input) && (input.to_f >= 1 || input.to_i >= 1)
end

def valid_int?(input)
  input.to_i.to_s == input && input.to_i >= 0
end

prompt("Welcome to the loan calculator!")

loop do
  total_loan_amt = ''
  loop do
    prompt("Enter your total loan amount:")
    total_loan_amt = gets.chomp
    # Right now this won't take any number less than 1.
    if valid_float?(total_loan_amt)
      break
    else
      prompt("Please enter a valid number.")
    end
  end

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
    prompt("Enter the number of years remaining on your loan:")
    loan_left_years = gets.chomp
    if valid_int?(loan_left_years)
      break
    else
      prompt("Please enter a whole number.")
    end
  end

  loan_left_mo = ''
  loop do
    prompt("Enter the number of months remaining on your loan:")
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
  mo_payment = total_loan_amt.to_f * ((mo_int / 100) / (1 - (1 + (mo_int / 100))**(-loan_term)))
  p mo_payment
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

# Rubocop passes aside from line length on 62 and 120.

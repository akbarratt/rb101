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
  SET mo_int = ???
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

=end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_float?(input)
  input.to_f.to_s == input
end

def valid_int?(input)
  input.to_i.to_s == input
end

loop do
  # GET total loan amount
  loop do
    prompt("Enter your total loan amount:")
    total_loan_amt = gets.chomp
    if valid_float?(total_loan_amt)
      break
    elsif valid_int?(total_loan_amt)
      total_loan_amt = total_loan_amt.to_f
      break
    else
      prompt("Please enter a valid number.")
    end
  end

  puts total_loan_amt # this needs to be initialized outside the loop

  # SET total_loan_amt = total loan amount
  #   IF total_loan_amt is valid float
  #     continue
  #   ELSE IF total_loan_amt is valid integer
  #     convert to float
  #   ELSE
  #     "Please enter a valid number"





  prompt("Do you want to perform another calculation? (Y/N)")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

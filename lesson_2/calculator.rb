# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require 'yaml'
MESSAGES = YAML.load_file('calc.yml')

def prompt(message)
  puts("=> #{message}")
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def valid_number?(input)
  integer?(input) || float?(input)
end

def input_conversion(string)
  if string.to_f % 1 == 0.0
    string = string.to_i
  else
    string = string.to_f
  end
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

def display_result(output)
  if output % 1 == 0.0
    prompt("The result is #{output.to_i}")
  else
    prompt("The result is #{output}")
  end
end

prompt("Welcome to Calculator! Enter your name:")
name = ''
loop do
  name = gets.chomp

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = gets.chomp

    if valid_number?(number1)
      input_conversion(number1)
      break
    else
      prompt("Hmm... That doesn't look like a valid number.")
    end

    input_conversion(number1)
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt("Hmm... That doesn't look like a valid number.")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(MESSAGES["operator"])

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  # Conversion of user input to integer or float as appropriate.
  if number1.to_f % 1 == 0.0
    number1 = number1.to_i
  else
    number1 = number1.to_f
  end

  if number2.to_f % 1 == 0.0
    number2 = number2.to_i
  else
    number2 = number2.to_f
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when "1"
             number1 + number2
           when "2"
             number1 - number2
           when "3"
             number1 * number2
           when "4"
             number1 / number2
           end  

  display_result(result)

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator. Goodbye!")

# Extrapolate messages to YAML.
# Internationalize.
# More single-use methods.
# Run rubocop.

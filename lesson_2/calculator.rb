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

prompt(MESSAGES["welcome"])
name = ''
loop do
  name = gets.chomp

  if name.empty?()
    prompt(MESSAGES["valid_name"])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES["input1"])
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES["invalid_number"])
    end

    input_conversion(number1)
  end

  number2 = ''
  loop do
    prompt(MESSAGES["input2"])
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES["invalid_number"])
    end
  end

  prompt(MESSAGES["operator"])

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES["invalid_operator"])
    end
  end

  # Conversion of user input to float.
  number1 = number1.to_f
  number2 = number2.to_f

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when "1"
             number1 + number2
           when "2"
             number1 - number2
           when "3"
             number1 * number2
           when "4"
             number1 / number2 # This needs to always be float division.
           end  

  display_result(result)

  prompt(MESSAGES["repeat"])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator, #{name}. Goodbye!")

# Extrapolate messages to YAML.
# Internationalize.
# More single-use methods.
# Run rubocop.

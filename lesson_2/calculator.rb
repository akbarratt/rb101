# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require 'yaml'
MESSAGES = YAML.load_file('calc.yml')
VALID_LANGUAGES = %(en es fr)

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
    prompt(MESSAGES[language]["result"] + output.to_i.to_s)
  else
    prompt(MESSAGES[language]["result"] + output.to_s)
  end
end

prompt(MESSAGES["en"]["language"])
language = gets.chomp
unless VALID_LANGUAGES.include?(language)
  language = "en"
end

prompt(MESSAGES[language]["welcome"])
# name = ''
# loop do
#   name = gets.chomp

#   if name.empty?()
#     prompt(MESSAGES[language]["valid_name"])
#   else
#     break
#   end
# end

# prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES[language]["input1"])
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES[language]["invalid_number"])
    end

    input_conversion(number1)
  end

  number2 = ''
  loop do
    prompt(MESSAGES[language]["input2"])
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES[language]["invalid_number"])
    end
  end

  prompt(MESSAGES[language]["operator"])

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES[language]["invalid_operator"])
    end
  end

  prompt((MESSAGES[language][operator]) + (MESSAGES[language]["numbers"]))

  # Conversion of user input to float.
  number1 = number1.to_f
  number2 = number2.to_f

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

  if result % 1 == 0.0
    prompt(MESSAGES[language]["result"] + result.to_i.to_s)
  else
    prompt(MESSAGES[language]["result"] + result.to_s)
  end

  prompt(MESSAGES[language]["repeat"])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES[language]["goodbye"])

# Extrapolate messages to YAML.
# Internationalize.
# More single-use methods.
# Run rubocop.
# Now that I've internationalized, the operation_to_message function is out of date. Could extrapolate to a hash? Can we squeeze this into the YAML file?
# I can use concatenation as long as everything involved is a string.
# A nested hash with language as key, then number key, then value

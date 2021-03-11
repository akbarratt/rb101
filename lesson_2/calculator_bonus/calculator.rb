require 'yaml'
MESSAGES = YAML.load_file('calc.yml')
SUPPORTED_LANGUAGES = %(en es fr)

def prompt(message)
  puts("=> #{message}")
end

def get_language
  loop do
    input = gets.chomp
    if input.empty?
      prompt(MESSAGES["language_error"])
    elsif SUPPORTED_LANGUAGES.include?(input)
      return input
    else
      prompt(MESSAGES["language_error"])
    end
    # Bug: I have to explicitly check for empty input or it returns an empty string. Running into implicit return?
  end
end

def get_name
  loop do
    input = gets.chomp
    return input unless input.empty?
    prompt(MESSAGES[LANGUAGE]["valid_name"])
  end
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

system("clear")

prompt(MESSAGES["language"])
LANGUAGE = get_language

# Extrapolate into get name method
prompt(MESSAGES[LANGUAGE]["name_prompt"])
name = get_name

prompt(MESSAGES[LANGUAGE]["welcome"] + name + ".")

# Redundant, so extrapolate into a get number method
loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES[LANGUAGE]["input1"])
    number1 = gets.chomp
    break if valid_number?(number1)
    prompt(MESSAGES[LANGUAGE]["invalid_number"])
  end

  number2 = ''
  loop do
    prompt(MESSAGES[LANGUAGE]["input2"])
    number2 = gets.chomp
    break if valid_number?(number2)
    prompt(MESSAGES[LANGUAGE]["invalid_number"])
  end

  prompt(MESSAGES[LANGUAGE]["operator"])

  # Extrapolate into get operation method
  operator = ''
  loop do
    operator = gets.chomp
    break if %w(1 2 3 4).include?(operator)
    prompt(MESSAGES[LANGUAGE]["invalid_operator"])
  end

  prompt((MESSAGES[LANGUAGE][operator]) + (MESSAGES[LANGUAGE]["numbers"]))

  # Conversion of user input to float. (This could be a method?)
  number1 = number1.to_f
  number2 = number2.to_f

  # Extrapolate into perform operation method
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

  # Print result as integer or float, as appropriate. Extrapolate into display result method
  if result % 1 == 0.0
    prompt(MESSAGES[LANGUAGE]["result"] + result.to_i.to_s)
  else
    prompt(MESSAGES[LANGUAGE]["result"] + result.to_s)
  end

  # Extrapolate into calculate again? method.
  prompt(MESSAGES[LANGUAGE]["repeat"])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(name + MESSAGES[LANGUAGE]["goodbye"])

# To Do:
# Clear screen between calculations.
# Disallow divide by 0.
# Disallow input other than supported languages.
# Disallow input other than y, yes, n, or no. (Other languages?)

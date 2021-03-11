require 'yaml'
MESSAGES = YAML.load_file('calc.yml')
SUPPORTED_LANGUAGES = %(en es fr)

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

prompt(MESSAGES["language"])
language = gets.chomp
unless SUPPORTED_LANGUAGES.include?(language)
  language = "en"
end

prompt(MESSAGES[language]["name_prompt"])
name = ''
loop do
  name = gets.chomp
  break unless name.empty?
  prompt(MESSAGES[language]["valid_name"])
end

prompt(MESSAGES[language]["welcome"] + name + ".")

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES[language]["input1"])
    number1 = gets.chomp
    break if valid_number?(number1)
    prompt(MESSAGES[language]["invalid_number"])
  end

  number2 = ''
  loop do
    prompt(MESSAGES[language]["input2"])
    number2 = gets.chomp
    break if valid_number?(number2)
    prompt(MESSAGES[language]["invalid_number"])
  end

  prompt(MESSAGES[language]["operator"])

  operator = ''
  loop do
    operator = gets.chomp
    break if %w(1 2 3 4).include?(operator)
    prompt(MESSAGES[language]["invalid_operator"])
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

  # Print result as integer or float, as appropriate.
  if result % 1 == 0.0
    prompt(MESSAGES[language]["result"] + result.to_i.to_s)
  else
    prompt(MESSAGES[language]["result"] + result.to_s)
  end

  prompt(MESSAGES[language]["repeat"])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(name + MESSAGES[language]["goodbye"])

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
    # Bug: I have to specifically check for empty input or
    # it returns an empty string. Running into implicit return?
    # Debugging: This only seems to work when referencing the YAML file.
    # When I replace with a puts, it works as expected.
  end
end

def get_name(lang)
  loop do
    input = gets.chomp
    return input unless input.empty?
    prompt(MESSAGES[lang]["valid_name"])
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

def get_number(lang)
  loop do
    input = gets.chomp
    if valid_number?(input)
      return input.to_f
    else
      prompt(MESSAGES[lang]["invalid_number"])
    end
  end
end

def get_operator(lang)
  loop do
    prompt(MESSAGES[lang]["operator"])
    selection = gets.chomp
    return selection if %w(1 2 3 4).include?(selection)
    prompt(MESSAGES[lang]["invalid_operator"])
  end
end

def calculate(input1, input2, op, lang)
  case op
  when "1"
    input1 + input2
  when "2"
    input1 - input2
  when "3"
    input1 * input2
  when "4"
    if input2 == 0.0
      (MESSAGES[lang]["divide_zero"])
    else
      input1 / input2
    end
  end
end

def print_result(input, lang)
  if input % 1 == 0.0
    prompt(MESSAGES[lang]["result"] + input.to_i.to_s)
  else
    prompt(MESSAGES[lang]["result"] + input.to_s)
  end
end

def calculate_again?(lang)
  loop do
    prompt(MESSAGES[lang]["repeat"])
    answer = gets.chomp
    if answer.downcase == "yes" || answer.downcase == "y"
      return true
    elsif answer.downcase == "no" || answer.downcase == "n"
      return false
    else
      prompt(MESSAGES[lang]["repeat_error"])
    end
  end
end

system("clear")

prompt(MESSAGES["language"])
language = get_language

prompt(MESSAGES[language]["name_prompt"])
name = get_name(language)

loop do # main loop
  system("clear")
  prompt(MESSAGES[language]["welcome"] + name + ".")
  prompt(MESSAGES[language]["input1"])
  number1 = get_number(language)
  prompt(MESSAGES[language]["input2"])
  number2 = get_number(language)

  operator = get_operator(language)

  prompt((MESSAGES[language][operator]) + (MESSAGES[language]["numbers"]))

  result = calculate(number1, number2, operator, language)
  print_result(result, language)

  break if calculate_again?(language) == false
end

prompt(name + MESSAGES[language]["goodbye"])

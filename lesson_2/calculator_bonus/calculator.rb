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
    # Bug: I have to specifically check for empty input or it returns an empty string. Running into implicit return?
    # Debugging: This only seems to work when referencing the YAML file. When I replace with a puts, it works as expected.
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

<<<<<<< HEAD
system("clear")

prompt(MESSAGES["language"])
language = gets.chomp
unless SUPPORTED_LANGUAGES.include?(language)
  language = "en"
=======
def get_number(lang)
  loop do
    input = gets.chomp
    if valid_number?(input)
      return input.to_f
    else
      prompt(MESSAGES[lang]["invalid_number"])
    end
  end
>>>>>>> calc_dev
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
    # Bug: Need to add error message.
  end
end

system("clear")

prompt(MESSAGES["language"])
language = get_language

prompt(MESSAGES[language]["name_prompt"])
name = get_name(language)

prompt(MESSAGES[language]["welcome"] + name + ".")

loop do # main loop
  prompt(MESSAGES[language]["input1"])
  number1 = get_number(language)
  prompt(MESSAGES[language]["input2"])
  number2 = get_number(language)

  prompt(MESSAGES[language]["operator"])

  # Extrapolate into get operator method
  operator = ''
  loop do
    operator = gets.chomp
    break if %w(1 2 3 4).include?(operator)
    prompt(MESSAGES[language]["invalid_operator"])
  end

  prompt((MESSAGES[language][operator]) + (MESSAGES[language]["numbers"]))

  # Extrapolate into perform operation method
  result = case operator
           when "1"
             number1 + number2
           when "2"
             number1 - number2
           when "3"
             number1 * number2
           when "4"
             number1 / number2 # Disallow division by 0.
           end

  # Print result as integer or float, as appropriate. Extrapolate into display result method
  if result % 1 == 0.0
    prompt(MESSAGES[language]["result"] + result.to_i.to_s)
  else
    prompt(MESSAGES[language]["result"] + result.to_s)
  end

  # Extrapolate into calculate again? method.
  break if calculate_again?(language) == false
end

prompt(name + MESSAGES[language]["goodbye"])

# To Do:
# Clear screen between calculations.
# Disallow divide by 0.
# Disallow input other than supported languages.
# Disallow input other than y, yes, n, or no. (Other languages?)

# To get around the scoping problem of LANGUAGES, other than by making it a constant (possible not best practice?) I would have to have the methods take a parameter of the language.

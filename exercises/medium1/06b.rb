OPERATORS = {
  '+' => 'ADD',
  '-' => 'SUB',
  '*' => 'MULT',
  '/' => 'DIV',
  '%' => 'MOD'
}

def minilang(string)
  stack = []
  register = 0
  queue = string.split(' ')
  queue.each do |element|
    register = element.to_i if element.to_i.to_s == element
    case element
    when 'PRINT'
      print(register)
    when 'PUSH'
      push(stack, register)
    when 'ADD'
      integer = stack.pop
      register = add(register, integer)
    when 'SUB'
      integer = stack.pop
      register = subtract(register, integer)
    when 'MULT'
      integer = stack.pop
      register = multiply(register, integer)
    when 'DIV'
      integer = stack.pop
      register = divide(register, integer)
    when 'MOD'
      integer = stack.pop
      register = mod(register, integer)
    when 'POP'
      register = pop(stack)
    end
  end
end

def print(int)
  puts int
end

def push(stack, register)
  stack << register
end

def add(register, int)
  int + register
end

def subtract(register, int)
  register - int
end

def multiply(register, int)
  register * int
end

def divide(register, int)
  register / int
end

def mod(register, int)
  register % int
end

def pop(stack)
  stack.pop
end

# minilang('20 PUSH 7 SUB PRINT')
# minilang('3 PUSH 5 MOD PRINT')
# minilang('2 PUSH 16 DIV PRINT')
# minilang('20 PUSH -7 ADD PRINT')
#minilang('3 PUSH POP 6 PUSH 12 DIV PRINT')
#minilang('PRINT')
#minilang('5 PUSH 3 MULT PRINT')
#minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
#minilang('5 PUSH POP PRINT')
#minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
#minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
#minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
#minilang('-3 PUSH 5 SUB PRINT')
#minilang('6 PUSH')


# Further exploration

def translate_to_minilang(str)
  final_array = []
    case str
    when '%'
      final_array << 'MOD'
    when '+'
      final_array << 'ADD'
    when '*'
      final_array << 'MULT'
    when '-'
      final_array << 'SUB'
    when '/'
      final_array << 'DIV'
    else
      final_array << str.to_i
    end
  final_array.join(' ')
end



=begin
## Problem
Taking in a string consisting of an equation, return a minilang program that can be passed through and return a result. 

Input: string
Output: minilang program (string)
Return: nil (because it will print)

## Examples
minilang(equation_printer("(3 + (4 * 5) - 7) / (5 % 3)"))
# => 8
# nil

minilang(equation_printer("4 * 5"))
# => 20
# nil

minilang(equation_printer("(5 / 1) / 1 / 1"))
# => 5
# nil

Think of more edge cases...
Invalid input? Empty stack?

## Data structures
operators array
.each_char
case statement

## Algorithm
Given a string containing an equation.
Process the string:
  - Remove spaces
  - Reverse string
  - Reverse parentheticals
  - If contains chars other than '0-9', or OPERATORS, return error
Initialize an empty string 'output'
Initialize empty array 'ops'
Iterate through each character in the string.
  For '(', skip to the next iteration
  # Bug here: if we're iterating by character, how will we pull out numbers that are > 1 digit?
  For integers push int.to_s to output string
  For operators, output << 'PUSH' and ops << operator
  For ')', output << ops.pop
Until ops.empty?, output << ops.pop
output << 'PRINT'
return output string

Thought: Rather than iterating through a string, I think we will have to convert the string to an array, filtering for numbers and separating them out. This will have to be yet another sub-method.

  ### Sub-problem
  Given a string, convert to an array of strings, but will all integer groups separated as one integer of 1 or more characters.

  Example
  chars_and_nums('abc123') == ['a', 'b', 'c', '123']

  Algorithm
  Given a string...
  Initialize empty array 'output_array'
  Initialize empty string 'current_string'
  Iterate through each char
    if current_string.include?(0..9) && char is an int
      current_string << char
    else
      output_array << current_string
      current_string = char
    end
  output_array << current_string
  output_array

=end

NUMS = ('0'..'9').to_a

def chars_and_nums(string)
  output_array = []
  current_string = ''
  string.each_char do |char|
    if current_string.to_i.to_s == current_string &&
       NUMS.include?(char)
      current_string << char
    else
      output_array << current_string unless current_string.empty?
      current_string = char
    end
  end
  output_array << current_string
  output_array
end


def equation_printer(equation_string)
  operators = []
  equation = reverse_paren(equation_processor(equation_string))
  p equation
end

def equation_processor(string)
  string.delete(' ').reverse!
end

def reverse_paren(string)
  output_string = ''
  string.each_char do |char|
    if char == '('
      output_string << ')'
    elsif char == ')'
      output_string << '('
    else
      output_string << char
    end
  end
  output_string
end

equation_printer("(3 + (4 * 5) - 7) / (5 % 3)")
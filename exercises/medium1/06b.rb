OPS = {
  '+' => 'ADD',
  '-' => 'SUB',
  '*' => 'MULT',
  '/' => 'DIV',
  '%' => 'MOD'
}
NUMS = ('0'..'9').to_a
VALID_CHARS = NUMS + OPS.keys + ['(', ')', ' ']

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

minilang('20 PUSH 7 SUB PRINT')
minilang('3 PUSH 5 MOD PRINT')
minilang('2 PUSH 16 DIV PRINT')
minilang('20 PUSH -7 ADD PRINT')
minilang('3 PUSH POP 6 PUSH 12 DIV PRINT')
minilang('PRINT')
minilang('5 PUSH 3 MULT PRINT')
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
minilang('5 PUSH POP PRINT')
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
minilang('-3 PUSH 5 SUB PRINT')
minilang('6 PUSH')

# Further Exploration

def equation_printer(equation_string)
  operators = []
  program = []
  return "invalid input" unless valid?(equation_string)
  equation = equation_processor(equation_string)
  equation.each do |string|
    if string == '('
      next
    elsif OPS.keys.include?(string)
      program << 'PUSH'
      operators << OPS[string]
    elsif string == ')'
      program << operators.pop
    else
      program << string
    end
  end
  program << operators.pop until operators.empty?
  program << 'PRINT' 
  program.join(' ')
end

def valid?(string)
  string.chars.all? { |object| VALID_CHARS.include?(object) }
end

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

def equation_processor(string)
  string = string.delete(' ').reverse!
  string = reverse_paren(string)
  string = chars_and_nums(string)
  string
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
minilang(equation_printer("(3 + (4 * 5) - 7) / (5 % 3)"))
minilang(equation_printer("(5 / 1) / 1 / 1"))
minilang(equation_printer("4 * 5"))
p equation_printer("MEH")
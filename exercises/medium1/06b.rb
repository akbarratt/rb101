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
  string.split.each do |element|
    register = element.to_i if element.to_i.to_s == element
    case element
    when 'ADD'   then register += stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'SUB'   then register -= stack.pop
    when 'PUSH'  then stack.push(register)
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts register
    else              register = element.to_i
    end
  end
end

# minilang('20 PUSH 7 SUB PRINT')
# minilang('3 PUSH 5 MOD PRINT')
# minilang('2 PUSH 16 DIV PRINT')
# minilang('20 PUSH -7 ADD PRINT')
# minilang('3 PUSH POP 6 PUSH 12 DIV PRINT')
# minilang('PRINT')
# minilang('5 PUSH 3 MULT PRINT')
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# minilang('5 PUSH POP PRINT')
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# minilang('-3 PUSH 5 SUB PRINT')
# minilang('6 PUSH')

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

p equation_printer("(3 + (4 * 5) - 7) / (5 % 3)")
minilang(equation_printer("(3 + (4 * 5) - 7) / (5 % 3)"))
minilang(equation_printer("(5 / 1) / 1 / 1"))
minilang(equation_printer("4 * 5"))
minilang(equation_printer("MEH"))

# Notes: Still need to add error handling and stack empty conditions.

require 'pry'

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

# writing a new method to solve this problem
# 4 push 5 mult
# store the result in place of the parentheses
# 5 push 3 mod
# store the result in place of the parentheses
# 3 push 20 ADD PUSH -7 ADD
# 16 / 2
# 16 pu

def equation_analyzer(str)
  equation_array = []
  result_array = []
  open_parenth = 0
  closed_parenth = 0
  str.each_char do |character|
    open_parenth += 1 if character == '('
    closed_parenth += 1 if character == ')'
    equation_array << character
    if open_parenth == closed_parenth 
      result_array << equation_array.join
      open_parenth = 0
      closed_parenth = 0
      equation_array = []
    end
  end
    result_array.delete(' ')
    result_array
end

def start_end_with_parentheses?(string)
  string[0] == '(' && string[-1] == ')'
end

def parentheses_eater!(str)
  new_str = str
  new_str[0] =''
  new_str[-1]= ''
  new_str
  p str
end

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

def equation_handler(str)
  temp_arr = []
  seperated_equation_array = equation_analyzer(str)
  seperated_equation_array.each do |miniquation|
    miniquation[0] = '' if miniquation.start_with?('(')
    miniquation[-1] = '' if miniquation.end_with?(')')
    temp_arr << equation_analyzer(miniquation)
  end
  temp_arr.reverse!
  final_array = []
  temp_arr.each do |outter|
    outter.each do |inner|
      if start_end_with_parentheses?(inner)
        parentheses_eater!(inner)
        inner.each_char do |char|
          final_array << translate_to_minilang(char) if char != ' '
        end
        next
      end
      final_array << translate_to_minilang(inner)
      p final_array
    end
  end
end

equation_handler("(3 + (4 * 5) - 7) / (5 % 3)")
# if miniquation includes %, -, or /
# case miniquation
# reverse
# translate to minilang


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

# (3 + (4 * 5) - 7) / (5 % 3) = 8 turn this into string
# algorithm
# put everything into parentheses
  # convert problem to a string
  # append/prepend parentheses
# loop: turn each nested parentheses into a string of commands
  # iterate through string 
  #(3 +, 
  #(4 * 5), 4 PUSH 5 MULT
  # - 7) /, 
  #(5 % 3) => 5 PUSH 3 MOD
 #===>
  #(3 +,
  #4 PUSH 5 MULT => 4 PUSH 5 MULT ... 3 PUSH ADD .. PUSH 7 SUB
  # - 7) /, 
  #5 PUSH 3 MOD
 #====>
  # 


  #  loop if () present in problem
    # solve everything in parentheses 
    # append everything back together
    # break if no parenthese
      #solve problem
    
    # pass into array
# loop pass commands to minilang
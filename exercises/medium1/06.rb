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


minilang(operatorminilang("(3 + (4 * 5) - 7) / (5 % 3)"))
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
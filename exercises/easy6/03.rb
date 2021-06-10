def find_fibonacci_index_by_length(integer)
  int1 = 1
  int2 = 1
  current_num = 0
  index = 2
  until current_num.digits.length == integer
    current_num = int1 + int2
    int1 = int2
    int2 = current_num
    index += 1
  end
  index
end


p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847


=begin
# Problem
Given a integer, return the index number at which point in the Fibbonacci sequence the first number with int number of digits appears.

Input: integer
Output: integer

Fib sequence is always the sum of the previous two numbers.
How to calculate? Would I even need an array for this?

# Examples
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

# Algorithm
Until current_num.length = input_int
Add the last two digits
Maybe we don't need access to the Fib sequence for this.

GIVEN an integer
initialize INT1 and INT2 as both == 1
  Until current_num.length = input_int
    current_number = INT1 + INT2
    INT 1 = INT2
    INT2 = current_number
  Return current number
=end
<!-- a method that returns the sum of two integers  -->

START

GET integer from user
SET num 1 = user input

GET integer from user
SET num 2 = user input

IF num1 && num2 are integers
  SET sum = num1 + num2
ELSE
  PRINT "error message"

PRINT sum

END

<!-- a method that takes an array of strings, and returns a string that is all those strings concatenated together  -->

Given an array of strings named "strings"

START

SET result = 

FOR EACH string in "strings"
  string >> result

PRINT result

END

<!-- a method that takes an array of integers, and returns a new array with every other element -->

Given an array of integers

SET every_other =

FOR EACH integer in integers
  IF integers[integer] = odd
    integer >> every_other
  ELSE
    next

PRINT every_other

END
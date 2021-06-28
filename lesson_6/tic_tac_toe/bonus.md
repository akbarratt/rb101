# Problem: joinor method



Implicit requirements: this will take an array argument and optional arguments for separator and final word. (See examples below.) Default separator is ', ' and default word is "or". 

May need to be a nested array, such as using splat to separate the front characters of the arrary from the final. On nested_array[0], join(separator ) should be run, then the evaluated results should be called with join(word)

# Examples
joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

Note: I feel this method could possibly be improved by requiring the user to provide only a separator and not the space that follows.

# Data structures
Inputs: array, optional strings
Output: string


___
# Problem: Graphical display of open squares

# Example:
|1|2|3|
|4|5|6|
|7|8|9|

|1|2|_|
|_|5|6|
|7|8|_|
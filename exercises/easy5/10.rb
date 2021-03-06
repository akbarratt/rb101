def print_in_box(input_string)
  box = ['+--+', '|  |', '|  |', '|  |', '+--+']
  counter = 0
  while counter < box.size
    if counter == 0 || counter == 4
      box[counter][2] += '-' until box[counter].size >= input_string.size + 4
    elsif counter == 1 || counter == 3
      box[counter][2] += ' ' until box[counter].size >= input_string.size + 4
    else
      box[counter].insert(2, input_string)
    end
    counter += 1
  end
  puts box
end

print_in_box('')
print_in_box('hello world')
print_in_box('what is up?')
print_in_box('The rain in Spain falls mainly on the plain.')

=begin
# Problem
Given a string, output an ASCII box around the text

I guess these are all strings?
Input: string
Output: string?? Really we're calling puts on an array.

\n = newline

# Examples
print_in_box('')
+--+
|  |
|  |
|  |
+--+

# Data structures
Array? It will puts one line at a time.

# Algorithm
GIVEN a string
Initialize a new array with the box structure.
Determine string length
For each string, transformatively insert the appropriate character to input_string.length, except for index [2], which will have input_string inserted
Return box

=end
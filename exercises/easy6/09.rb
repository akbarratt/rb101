def include?(input_array, search_object)
  counter = 0
  # This has to be >= so the loop runs at least once.
  until counter >= input_array.length do 
    if input_array[counter] == search_object
      return true
    else
      counter += 1
    end
  end
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

=begin
# Problem
Create a method which takes an array and a search object and outputs a Boolean determining whether the search object is found in the array. Array#include? may not be used.

Input: array and object
Output: boolean

# Examples 
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false

# Data Structures
Array

# Algorithm
GIVEN an input_array and a search_object
Loop through the array items, "current_object", and compare to search_object for equality.
If equality is true
  break and return true
Else
  Continue
Return false

=end
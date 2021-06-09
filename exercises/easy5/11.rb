# It returns a different object because the destructive method used, String#reverse!, is not called on the string but on the result of calling String#split on the user input.

# The same output could be accomplished in this way:

def spin_me(str)
  str.split.map do |word|
    word.reverse
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# The only reason Enumerable#each needed to be used in the first place is because each always returns the original calling object, in this case the array resulting from String#split.
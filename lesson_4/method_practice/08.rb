# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# [1, 2]

# We can learn about take by referencing the Tuby documentation on array methods. Take returns the first given number of elements from an array and returns them in a new array. It is not destructive. We can see in Array#take's signature that the result of .take is a new array.

# Another way to see how Array#take works is by testing it in irb.
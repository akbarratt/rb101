# -------Immutable Array Elements--------

a = 2
b = [5, 8]
arr = [a, b] # [2, [5, 8]]

# a and arr[0] object_id are identical
# b[0] and arr[1][0] object_id are identical

arr[0] += 2
p arr # [4, [5, 8]]
p a # 2

# a object_id is the same, arr[0] has changed (reassignment)

arr[1][0] -= a
p arr  # [4, [3, 8]]
p b # [3, 8]

# b[0] and arr[1][0] object_id have changed to the same Integer object

# -------Mutable Array Elements--------

a = 'apple'
b = ['banana', 'blueberry']
arr = [a, b] # ["apple", ["banana", "blueberry"]]

# a and arr[0] object_id are identical
# b[0] and arr[1][0] object_id are identical

arr[0] += 's'
p arr # ["apples", ["banana", "blueberry"]]
p a # "apples"

# a and arr[0] object_id have both changed and have been assigned to the same new string object

arr[1][0] += 's'
p arr  # ["apples", ["bananas", "blueberry"]]
p b # ["bananas", "blueberry"]

# b[0] and arr[1][0] object_id have changed to the same new string object

# ---------Mutable Elements, Destructive Methods-----------

a = 'apple'
b = ['banana', 'blueberry']
arr = [a, b] # ["apple", ["banana", "blueberry"]]

# a and arr[0] object_id are identical
# b[0] and arr[1][0] object_id are identical

arr[0] << 's'
p arr # ["apples", ["banana", "blueberry"]]
p a # "apples"

# a and arr[0] object_id are both still the same and the string stored at that place in memory has been mutated

arr[1][0] << 's'
p arr  # ["apples", ["bananas", "blueberry"]]
p b # ["bananas", "blueberry"]

# b[0] and arr[1][0] object_id are both still the same and the string stored at that place in memory has been mutated

# In the example of a, the referent is the integer itself. In example b, the referent is an array object. Because array[1] and b point to the same array (container), the object at [0] changes for both, because the array being referenced is the same.

# When we chain Array#[], we have to remember that each method call is being evaluated before the next is called. So arr[1][0] is actually calling [0] on the array referenced by b. They are the same object. That's why the reference changes.
['arc', 'bat', 'cape', 'ants', 'cap'].sort

# ants
# arc
# bat
# cap
# cape

[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort

# ['a', 'car', 'd']
# ['a', 'car', 'd', 3]
# ['a', 'cat', 'b', 'c']
# ['b', 2]

# Because of the integers, this .sort could result in an argument error since integers cannot be compared with strings. The error isn't thrown, presumably due to short-circuit evaluation.
hash = { a: 'ant', b: 'bear' }
hash.shift

# {a: 'ant'}
# Shift removes and returns the first item in a collection. However, when called on a hash, this method returns an array containing the key-value pair removed.
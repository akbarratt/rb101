## Example 6
```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
```

### Line
  1
### Action
  method call (`select`)
### Object
  original array
### Side Effect
  none
### Return Value
  new array
### Is Return Value Used?
  no

### Line
  2-5
### Action
  outer block executuion
### Object
  each hash in the array
### Side Effect
  none
### Return Value
  new array
### Is Return Value Used?
  yes, used to determine `select`

### Line
  2
### Action
  method call (`all?`) (conditional?)
### Object
  each hash in the array
### Side Effect
  none
### Return Value
  boolean
### Is Return Value Used?
  yes, to determine the return value of `select`

### Line
  3-4
### Action
  inner block execution
### Object
  each key-value pair within the hash
### Side Effect
  none
### Return Value
  boolean
### Is Return Value Used?
  yes, to determine the return value of `all?`
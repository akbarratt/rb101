## Example 3

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

### Line
  1
### Action
  method call (`map`)
### Object
  outer array
### Side Effect
  none
### Return Value
  new array [1, 3]
### Is Return Value Used?
  no

### Line
  1-4
### Action
  block execution
### Object
  each sub-array
### Side Effect
  none
### Return Value
  the first item of each sub-array
### Is Return Value Used?
  yes, to determine the return value of `map`

### Line
  2
### Action
  method call (`first`)
### Object
  each sub-array
### Side Effect
  none
### Return Value
  first item of sub-array
### Is Return Value Used?
  yes, used by `puts`

### Line
  2
### Action
  method call (`puts`)
### Object
  first item of sub-array
### Side Effect
  applies to_s on array item and outputs to terminal
### Return Value
  nil
### Is Return Value Used?
  no

### Line
  3
### Action
  method call (`first`)
### Object
  each sub-array
### Side Effect
  none
### Return Value
  first item of sub-array
### Is Return Value Used?
  yes, to determine the return value of the block


### Line

### Action

### Object

### Side Effect

### Return Value

### Is Return Value Used?
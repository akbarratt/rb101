## Example 5
```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
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
  ```[[2, 4], [6, 8]]```
### Is Return Value Used?
  no

### Line
  2-5
### Action
  execute block
### Object
  each sub-array
### Side Effect
  no
### Return Value
  new transformed array
### Is Return Value Used?
  yes, used for transformaiton by `map` on line 1

### Line
  2
### Action
  method call (`map`)
### Object
  each sub-array
### Side Effect
  none
### Return Value
  new transformed array
### Is Return Value Used?
  yes, to form a new sub-array

### Line
  2-4
### Action
  block execution
### Object
  element within each sub-array
### Side Effect
  none
### Return Value
  integer
### Is Return Value Used?
  yes, used by `map` on line 2

### Line
  3
### Action
  method call (`*`) with int 2 as argument
### Object
  current iteration array element
### Side Effect
  none
### Return Value
  array element * 2 (integer)
### Is Return Value Used?
  yes, used to determine return value of inner block
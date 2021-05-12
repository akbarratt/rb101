## Example 4

```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```

### Line
  1
### Action
  variable assignment
### Object
  outer array
### Side Effect
  none
### Return Value
  the return value of the block (the original array)
### Is Return Value Used?
  no

### Line
  1
### Action
  method call (`each`)
### Object
  outer array
### Side Effect
  none
### Return Value
  the original array (the calling object)
### Is Return Value Used?
  yes, in the variable assignment action

### Line
  1-7
### Action
  outer block execution
### Object
  each sub-array
### Side Effect
  none
### Return Value
  each sub-array
### Is Return Value Used?
  no

### Line
  2
### Action
  method call (`each`)
### Object
  each collection element in sub-array
### Side Effect
  none
### Return Value
  the original sub-array
### Is Return Value Used?
  yes, to determine the return value of the outer block

### Line
  3
### Action
  comparison operation (`>`)
### Object
  item within sub-array
### Side Effect
  none
### Return Value
  Boolean
### Is Return Value Used?
  yes, evaluated by `if`

3-5 Conditional (`if`)
Returns nil? (Because of the `puts` I guess?)

### Line
  4
### Action
  method call (`puts`)
### Object
  each element in the sub-array
### Side Effect
  item is converted to string and printed
### Return Value
  nil
### Is Return Value Used?
  yes, used to determine return value of the conditional statement if the condition is met
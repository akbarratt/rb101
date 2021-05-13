## Example 10
```ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
```

### Line
  1
### Action
  method call (`map`)
### Object
  original array
### Side Effect
  none
### Return Value
  [[[2, 3], [4, 5]], [6, 7]]
### Is Return Value Used?
  no

### Line
  2-11
### Action
  execute outer block
### Object
  first level sub-array
### Side Effect
  none
### Return Value
   [[[2, 3], [4, 5]], [6, 7]]
### Is Return Value Used?
  yes, to determine the result of `map` on line 1

### Line
  2
### Action
  method call (`map`)
### Object
  second level sub array
### Side Effect
  none
### Return Value
  new transformed array
### Is Return Value Used?
  yes, to determine the result of `map` on line 1

### Line
  3-10
### Action
  execute inner block
### Object
  third level array element
### Side Effect
  none
### Return Value
   [[[2, 3], [4, 5]], [6, 7]]
### Is Return Value Used?
  yes, in `map` on line 2

### Line
  3-9
### Action
  conditional (`if`)
### Object
  second level sub array element
### Side Effect
  none
### Return Value
  boolean
### Is Return Value Used?
  yes, to determine result passed to `map` on line 2

### Line
  3
### Action
  method call (`to_s`)
### Object
  second level sub array element
### Side Effect
  none
### Return Value
  result of element.to_s
### Is Return Value Used?
  yes, in `size` on line 3

### Line
  3
### Action
  method call `size`
### Object
  result of element.to_s
### Side Effect
  none
### Return Value
  integer
### Is Return Value Used?
  yes, in `equality` on line 1

### Line
  3
### Action
  method call (`==`)
### Object
  integer
### Side Effect
  none
### Return Value
  boolean
### Is Return Value Used?
  yes, to evaluate `if` on line 3

### Line
  4
### Action
  method call (`+`)
### Object
  3rd level sub array element
### Side Effect
  none
### Return Value
  integer
### Is Return Value Used?
  yes, to determine the return value of the block

### Line
  6
### Action
  method call (`map`)
### Object
  4th level sub array item
### Side Effect
  none
### Return Value
  integer
### Is Return Value Used?
  yes, to determine the return value of the block
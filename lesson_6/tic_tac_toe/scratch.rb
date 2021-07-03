def joinor(array, delimiter = ',', word = 'or')
  # return array if array.size <= 1
  # *list_items, final_item = array
  # list_items.join("#{delimiter} ") + "#{delimiter} #{word} #{final_item}"
  case array.size
  when 0..1 then return array
  when 2 then array.join(" #{word} ")
  else
    *list_items, final_item = array
    list_items.join("#{delimiter} ") + "#{delimiter} #{word} #{final_item}"
  end
end

# Should rewrite as case statement?

puts joinor([1, 2])                   # => "1 or 2"
puts joinor([1, 2, 3])                # => "1, 2, or 3"
puts joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
puts joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
puts joinor([1])                      # => "1"
puts joinor([])                      # => ""
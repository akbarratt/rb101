# for i in (1..99) 
#   puts i if i.odd?
# end

array = (1..99).to_a
# array.each {|n| puts n if n.odd?}
array.each {|n| puts n if n % 2 == 1}
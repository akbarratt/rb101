hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

new_array = []
hsh.each_pair do |_, details|
  if details[:type] == 'fruit'
    new_array << details[:colors].map {|color| color.capitalize}
  else
    new_array << details[:size].upcase
  end
end

p new_array

# p (hsh.map do |_, details|
#   if details[:type] == 'fruit'
#     details[:colors].map {|color| color.capitalize}
#   else
#     details[:size].upcase
#   end
# end)
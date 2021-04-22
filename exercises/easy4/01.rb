def short_long_short(str1, str2)
  new_str = ''
  if str1.length < str2.length
    new_str.concat(str1, str2, str1)
  else
    new_str.concat(str2, str1, str2)
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
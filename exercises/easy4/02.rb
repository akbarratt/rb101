ENDINGS = ['th', 'st', 'nd', 'rd'] 

def century(year)
  cent = (year/100.0).ceil.to_s
  if cent[-1] == "1"
    cent[-2] == "1" ? cent + ENDINGS[0] : cent + ENDINGS[1]
  elsif cent[-1] == "2"
    cent[-2] == "1" ? cent + ENDINGS[0] : cent + ENDINGS[2]
  elsif cent[-1] == "3"
    cent[-2] == "1" ? cent + ENDINGS[0] : cent + ENDINGS[3]
  else
    cent + ENDINGS[0]
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
p century(1) == '1st'
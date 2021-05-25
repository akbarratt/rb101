HEX = ('0'..'9').to_a + ('a'..'f').to_a
PATTERN = [8, 4, 4, 4, 12]

def generate_uuid
  uuid = ""
  PATTERN.each_with_index do |section, index|
    section.times { uuid << HEX.sample }
    uuid << '-' unless index >= PATTERN.size - 1
  end
  uuid
end

p generate_uuid
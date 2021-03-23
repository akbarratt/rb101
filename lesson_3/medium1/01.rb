# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!
flintstones = "The Flintstones Rock!"
def flintprint(string)
  10.times {
    puts string
    string.prepend(" ")
  }
end

flintprint(flintstones)

# 10.times { |number| puts (" " * number) + "The Flintstones Rock!" }
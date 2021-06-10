=begin
# Problem
Given a floating point number, return a string representation of that number as a precise measure.

In this sense, minutes and seconds are part of the notation and have nothing to do with how time is measured other than being base 60. The non-decimal number should be the number of degrees, with the decimal being further broken down into minutes and seconds. % should be useful for these operations.

Input: integer/float
Output: string

How do I separate what comes before the decimal from what comes after? Is there even a consistent way to do this? Rounding? Floor? Truncate?

Should probably convert all input to a float before calculating? Although most of these float method seem to be working the same way regardless. When dealing with zero the output will be zero regardless.

Won't worry about min/max degrees as that's not in the scope of the exercise.

Criteria:
Input must be between 0 and 360
Input should accept integers and floats
Minutes and seconds should be represented by a two digit number. The degrees can be 1 to 3 digits.
Use the provided constant to represent the degree symbol.

http://aprs.gids.nl/degMinSec.html

# Examples
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Data Structures

# Algorithm
GIVEN an integer or float
Convert user input to a float
Initialize variable degrees and set it to input.floor
Initialize variable minutes and set it to input - degrees * MINUTES IN DEGREE
Initialize variable seconds and set to (minutes - minutes.floor) * SECONDS IN MINUTE
[Convert all to string][Could use an array?][Don't they all need to also be converted to int?][Format minutes, seconds here: should be ints]
result = [degrees, minutes, seconds]
result.map |float|
  float.floor.to_i.to_s

Output interpolated string: "[degrees]DEGREE[minutes]'[seconds]""

=end

DEGREE = "\xC2\xB0"
DOUBLE_QUOTE = '"'
MINUTES_IN_DEGREE = 60
SECONDS_IN_MINUTE = 60

def dms(input)
  input = input.to_f
  degrees = input.floor
  minutes = (input - degrees) * MINUTES_IN_DEGREE
  seconds = (minutes - minutes.floor) * SECONDS_IN_MINUTE
  minutes, seconds = [minutes, seconds].map do |float|
    float = float.floor.to_s
    float.size == 1 ? float.prepend('0') : float
  end
  # CANNOT figure out the formatting here...
  %?#{degrees}#{DEGREE}#{minutes}'#{seconds}#{DOUBLE_QUOTE}?
end


p dms(30) # == %(30°00'00")
p dms(76.73) #== %(76°43'48")
p dms(254.6) #== %(254°36'00")
p dms(93.034773) #== %(93°02'05")
p dms(0) #== %(0°00'00")
p dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")
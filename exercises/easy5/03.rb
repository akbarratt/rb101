MINUTES_IN_HOUR = 60
MINUTES_IN_DAY = 1440
MINUTES_AT_MIDNIGHT = 0

def get_minutes(str)
  minutes = (str[0..1].to_i * MINUTES_IN_HOUR) + str[3..4].to_i
end

def after_midnight(str)
  result = MINUTES_AT_MIDNIGHT + get_minutes(str)
  return 0 if result == MINUTES_IN_DAY
  result
end

def before_midnight(str)
  result = MINUTES_IN_DAY - get_minutes(str)
  return 0 if result == MINUTES_IN_DAY
  result
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

=begin
# Problem
Take a string and convert it into however many minutes before or after midnight it is.

The string will need to be split out into hours and minutes (by index) with the colon disregarded, then converted into int.

Input: string in '00:00' format
Output: integer

# Examples
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

# Data structures
2 methods

# Algortithm
GIVEN a string representing a time
Convert the string into a singular integer representing minutes
Reduce that number to the amount that will fit within a single day (% 1440?)
Function after_midnight should add from 0
Function before_midnight should subtract from 1440
Need an edge case for if total == 1400 since that's functionally equivalent to 0.

=end
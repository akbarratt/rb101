def time_of_day(int)
  if num >= 0
    num -= 1440 until num <= 1439
  else
    num += 1440 until num >= -1439
  end
  return num
end

=begin
# Problem
Given a positive or negative integer representing minutes, return a string displaying how many minutes before or after midnight are represented.

Given there are only 24 hours in a day, multiples of 1440 should be added/subtracted.

Negative numbers should be subtracted from 24:00 and positive numbers should be added from 00:00 (does this present any edge cases? I think this works if >= 0 are positive and <= -1 are negative)

How do we get from the hours/minutes integers to the string output?

Output for minutes and seconds should be two digits long.

Input: integer
Output: string in "00:00" format

# Examples

time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

# Data structures
N/A

# Algorithm
GIVEN a positive or negative integer num
IF num >= 0
  Subtract 1440 until num <= 1439
  return num
ELSE
  Add 1440 until num >= -1439
  num += 1440 # this makes the number its positive equivalent
  return num
END

num % 60 will give the number of minutes
num / 60.floor will give the number of hours.

=end
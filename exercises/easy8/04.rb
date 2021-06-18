def leading_substrings(string)
  results = []
  1.upto(string.size) do |num|
    results << string.chars.combination(num).to_a
  end
  p results.map do |subarray|
    subarray.map do |substring|
      substring.flatten
    end
  end
  # Not sure why this is returning an enumerator.
end

leading_substrings('abcde')

=begin
# Problem
We could use Array#combination for Integer#upto(array.size) times with an incrementing index number.



=end
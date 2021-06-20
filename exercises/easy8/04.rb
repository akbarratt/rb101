def leading_substrings(string)
  results = []
  1.upto(string.size) do |num|
    results << string.chars.combination(num).to_a
  end
  results.map do |subarray|
    subarray.map! do |substring|
      substring.join
    end
  end
  results.flatten.sort
end

p leading_substrings('abcde')

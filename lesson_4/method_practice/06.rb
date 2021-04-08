['ant', 'bear', 'caterpillar'].pop.size

# 11
# When method are chained, each subsequent method is being called on the evaluated result of the method before it. Because the return value of .pop is the last item in an array, String#size is called on 'caterpillar', which itself was the result of Array#pop. The number of characters in the string is 11.
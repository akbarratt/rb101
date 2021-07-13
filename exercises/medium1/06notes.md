## Step by step in PEMDAS

(3 + (4 * 5) - 7) / (5 % 3)
`4 * 5`
(3 + (20) - 7) / (5 % 3)
`3 + 20`
(23 - 7) / (5 % 3)
`23 - 7`
16 / (5 % 3)
`5 % 3`
16 / 2
`16 / 2`
8

## Step by step in MINILANG

(3 + (4 * 5) - 7) / (5 % 3)
`3`
n = 3 stack = []
`PUSH`
n = 3 stack = [3]
`4`
n = 4 stack = [3]
`PUSH`
n = 4 stack = [3, 4]
`5`
n = 5 stack = [3, 4]
`MULT`
n = 20 stack = [3]
(3 + (20) - 7) / (5 % 3)
`ADD`
n = 23 stack = []
(23 - 7) / (5 % 3)
`PUSH`
n = 23 stack = [23]
`-7`
n = -7 stack = [23]
`ADD`
n = 16 stack = []
16 / (5 % 3)
`PUSH`
n = 16 stack = [16]
`5`
n = 5 stack = [16]
`PUSH`
n = 5 stack = [16, 5]
`3`
n = 3 stack = [16, 5]
`MOD`

<!-- The issue is that for /, % and 1, the operants are in the wrong order. -->

<!-- Do you have to feed the problem in backwards?? -->

## Step by step in MINILANG, reversed

(3 + (4 * 5) - 7) / (5 % 3)
Reversed: (3 % 5) / (7 - (4 * 5) + 3)
`3`
n = 3 stack = []
`PUSH`
n = 3 stack = [3]
`5`
n = 5 stack = [3]
`MOD`
n = 2 stack = [0]
`PUSH`
n = 2 stack = [2]
`7`
n = 7 stack = [2]
`PUSH`
n = 7 stack = [2, 7]
`4`
n = 4 stack = [2, 7]
`PUSH`
n = 4 stack = [2, 7, 4]
`5`
n = 5 stack = [2, 7, 4]
`MULT`
n = 20 stack = [2, 7]
`PUSH`
n = 20 stack = [2, 7, 20]
`3`
n = 3 stack = [2, 7, 20]
`ADD`
n = 23 stack = [2, 7]
`SUB`
n = 16 stack = [2]
`MOD`
n = 8 stack = []
`PRINT`
8

### Notes:
It seems like we may need to keep track of
1. When operators are encountered, saving them into a separate stack, then triggering them at different times
2. When begin or end parentheses are encountered
3. The output string should always end in PRINT

### Processing the string
1. Reverse the string
2. Remove whitespaces
3. Iterating through the string, each encountered integer, punctuation, or operator should trigger a push to the eventual output string.

### Examples (fix these):
5 + 4
'5 PUSH 4 ADD PRINT'

(5 + 4)
'5 PUSH 4 ADD PRINT'

(5 + 4)
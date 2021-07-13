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
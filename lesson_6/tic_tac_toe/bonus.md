### Flowchart: https://lucid.app/lucidchart/invitations/accept/inv_251883ec-426c-4f03-901b-0c6bf284fe33?viewport_loc=50%2C194%2C2231%2C1094%2C0_0

I ran out of fucking free items................

# Problem: joinor method

Implicit requirements: this will take an array argument and optional arguments for separator and final word. (See examples below.) Default separator is ', ' and default word is "or". 

May need to be a nested array, such as using splat to separate the front characters of the arrary from the final. On nested_array[0], join(separator ) should be run, then the evaluated results should be called with join(word)

# Examples
joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

Note: I feel this method could possibly be improved by requiring the user to provide only a separator and not the space that follows.

# Data structures
Inputs: array, optional strings
Output: string


___
# Problem: Graphical display of open squares

# Example:
|1|2|3|
|4|5|6|
|7|8|9|

|1|2|_|
|_|5|6|
|7|8|_|

___
# Problem: Coin toss

# Example:
=> Choose heads or tails:
=> Flipping coin...
=> Tails. Player goes first.
player1 = player
player2 = computer



___
# Problem: Allow player to choose marker (and choose computer marker)

Implicit requirements:
- Computer token should not equal player token.
- Computer should choose from a limited set of tokens.
- Should player also be limited?

# Example:
=> Choose any single character as a token (for example "X"):
"hi"
=> Invalid token. Please enter a single character:
"X"
=> Player is X; Computer is O

# Algorithm:
- Set a const to an array of choices ("X", "O", "C", "2") (maybe...?)


  ## Sub-problem: Choose computer token
    - If user[:token] is alphanumeric
      - Computer chooses "C"
        - Unless player[:token] == "C"
          - Then choose "X"
    - If user chooses "X"
      - Computer chooses "O" (or vice versa)
      (These two need to be combined; second should go first)

___
# Problem: Continue game

Should change "play again" to "continue playing?"
Could allow player to choose at which point in the loop to return to? Is this even possible? Should token selection etc be outside the loop instead?

___
# Problem: Improve gameplay loop
Rather than checking the board after each piece, we could simplify the loop, running a method that chooses a piece for either player, based on a variable indicating who is the current player.

# Algorithm
- Display board
- Current player place piece
  - Check for current player (how?)
  - Run method for human player or computer player
    - If current_player[:name] == "Computer"
      - Run computer_turn
    - Else
      - Run player_turn
  - Change current player (how?)
  - Check win && check tie
    - Break if win or tie
    - Else loop again

  ## Sub-problem: place_piece! method
    - see above
    - need to combine current two methods under one unified method.

  ## Sub-problem: how to set, determine, and change the current_player
    - alternate_player method (I don't like this var name because "alternate" could be read two ways)

# Problem: Decide which player goes first, initially based on coin toss, then based on who won the last round
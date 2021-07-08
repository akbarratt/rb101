___
IN PROGRESS
___
# Problem: Improve computer AI
Design the following improvements to the computer AI and implement them in order:
  - Choose winning square
  - Defend against opponent wins
  - Pick square 5 if available
  - Choose a square at random

  ## Sub-problem: choose winning square
  When any winning line consists of 2 computer tokens, the computer should place_piece in the third space.

  ## Sub-problem: defend square
  When any winning line consists of 2 player tokens, the computer should place_piece in the third space (could be consolodated with above? imminent_win?)

  This could become difficult because we iterate through the winning lines in order. What if there are multiples? What if there is a conflict? I suppose the computer should still prioritize moving if it can win.

  ## Sub-problem: pick square 5 if available
  If there are no imminent wins in any of the winning lines AND the center square is empty, the computer should place its piece in that square.





___
BUGS
___
Name validation accepts an empty string. Need better validation.


___
COMPLETED
___
# Problem: joinor method
Write a method that separates array items with a comma. The last item should also be separated by a word. 

Implicit requirements: this will take an array argument and optional arguments for separator and final word. (See examples below.) Default separator is ', ' and default word is "or". 

May need to be a nested array, such as using splat to separate the front characters of the arrary from the final. On nested_array[0], join(separator ) should be run, then the evaluated results should be called with join(word)

Note: I feel this method could possibly be improved by requiring the user to provide only a separator and not the space that follows.

# Examples
joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

Implied:
joinor([1])                      # => "1"
joinor([])                       # => "" ??

[1, 2].join(', ') + 'or 3'
*array, last = [1, 2, 3]
  => array = [1, 2]
  => last = 3 
  array.join("#{separator} ") + " #{word} #{last}"

# Data structures
Inputs: array, optional strings
Output: string

I think this will require a new array in order to insert the word.

# Algorithm
Given an array, separator, and 
If array size is 1 or less, return array.
If array size is 2, return array[0] + word + array[1]
Else, separate array into variables array and final item
Return array joined by "[separator][space]" concatenated with "[space][word][space][final item]"

___
# Problem: Coin toss
Prompt user to choose heads or tails

# Example:
=> Choose heads or tails:
=> Flipping coin...
=> Tails. Player goes first.
player1 = player
player2 = computer

# Algorithm
Initialize const COIN = ['heads', 'tails']
At last step of game set up, prompt user to select heads or tails and save into variable user_coin
Validate input
  Is the input text 'heads' or 'tails'?
  If not, is it 'h' or 't'?
  If not, is it '1' or '2'?
If invalid, assign a choice for the user.
If 

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
    - need to combine current two methods under one unified method depending on the value of current_player

  ## Sub-problem: how to set, determine, and change the current_player
    - alternate_player method (I don't like this var name because "alternate" could be read two ways)


# Problem: Decide which player goes first, initially based on coin toss, then based on who won the last round
Coin toss could set a key first_turn to true, then subsequent games 

Variable current_player should, on game initialization, be assigned to whichever player has the first_turn key set to true. Then current_player would alternate as described in the documentation. When a winner was determined, the winner's key would be set to true, and the other players reset. This seems like it would take a rather complicated method.

  ## Sub-problem: Determine winner
  Current method
  Problem: Every time we call "determine winner" we add +1 to the winner's record. So the tallying of score will need to be its own method that only gets called once. Like increment_wins. But this is another good reason for "determine winner" to return the user object

Game over?
  If no game ending condition, keep looping
  Check for tie
  Check for winner
    Check player token
    Check computer token
  If winner,
    Increment winner
    Change current player to winner
    Break

Check for grand champion
  If none, continue game
  If computer or user wins > 5, end game and declare grand champion



___
UNUSED FEATURES
___

___
# Problem: Graphical display of open squares

# Example:
|1|2|3|
|4|5|6|
|7|8|9|

|1|2|_|
|_|5|6|
|7|8|_|
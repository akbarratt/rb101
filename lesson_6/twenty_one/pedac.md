## Problem: Store the card totals in a local variable.
"If we cache each player's total like this, will it continue to update correctly throughout the game? If not, at what point do we need to update each player's total?"

## Question: Why is the last call to play_again? a little different from the previous two?
(from the sample solution)

## Problem: Ending the round.
"As mentioned above, there are 3 places where the round can end and we call play_again? each time. But another improvement we'd like to make is to give it a consistent end-of-round output. Right now, we get a grand output only after comparing cards. Can we extract this to a method and use it in the other two end-of-round areas?" (Not sure I understand this)

## Problem: Keep score and declare whoever reaches 5 points first as the winner.

## Problem: Store 21 in a hash so that the goal of the game is to reach whichever number is stored.
(Should DEALER_STAY = WINNING_LIMIT - 4?)

## Problem: Could I improve the way Aces are calculated?
(see store card totals problem above)

___
DONE
___

## Problem: Create deck
Upon game initialization, at the beginning of each round, generate a deck of 52 playing cards, 13 cards of 4 suits each.

Algorithm:
Set two consts arrays of strings
  1. SUITS = ['S', 'H', 'C', 'D']
  2. VALUES = ['A', 'K', 'Q', 'J', '10', '9', '8', '7', '6', '5', '4', '3', '2']
Set deck = result of the method generate_deck(suits, values)
  VALUES.map do |value|
    SUITS.map do |suit|
      value + suit
    end
  end

## Problem: Deal cards

### Sub-problem: determine value of deck
Given an array of strings representing playing cards, determine the value of the cards
case card[0]
when 'A' then 11
when 'K', 'Q', 'J' then 10
when card[0].to_int.to_s == card[0] then card[0].to_int

## Problem: Dealer turn loop
unless hand >= dealer_stay || busted?(hand)
  hand += hit
end

  ### Sub-problem: hit

## Problem: Player turn loop
If player has 21
  break
else
  loop
    loop
      get input
      validate input
    end
  if input == 'hit'
    player deck << hit
  else
    stay
    break
end

## Problem: Calculating Aces

## Game structure
Create deck
Deal player
Deal dealer
Display hands
Player turn loop
Player bust?
Dealer turn loop
Check for winner
Dealer bust?
Determine winner


## Problem: Display Hands
Given an array of strings that varies in length, print out those strings, separated by a space, on a single line.

For the dealer, the first card should be obscured.

Example:
=> Your hand: AH, 10C
=> Your hand total: 21
=> Dealer hand: 2H, AC, 5D
=> Dealer hand total: 18

Algorithm:
Method should take two inputs, a hand and a boolean=false to obscure the first card.

Initialize an empty string output ''
Iterate through the array.
  if card == hand[0] && boolean = true
    output << 'XX' + ' '
  elsif card == hand[-1]
    output << card
  else
    output << card + ' '
  end
end

## Problem: Determining outcome
if player bust || player_hand < dealer_hand
  :dealer_win
elsif dealer bust || player_hand > dealer_hand
  :player_win
else
  :tie

  ## Problem: Display Result
if :dealer_win
"The dealer wins!"
elsif :player_win
"You win!"
else
"It's a tie!"

Create deck
Deal player
Deal dealer
Player turn loop
  determine outcome?
  The reason this won't work is because if the player doesn't bust, we're not done with the game.
  If the player doesn't bust, we don't want to show results yet.
  So IF the player busts, we do want to run the game_over...
Player bust?
Dealer turn loop
Check for winner
Dealer bust?
Determine winner

## Problem: Game Status
During player turn, each loop should display the players' cards and point total, as well as the dealer's cards with the first card obscured.

During game_over, the player's cards and point total should be displayed and so should the dealer's, with no obfuscation.


## Other Things
If neither busts, we need to display the dealer's entire hand. In fact, we need to display the player hand and points and the dealer hand and points. Maybe modify the game status to make this reusable.

## Problem: Determining outcome
if player bust
  :dealer_win
elsif dealer bust
  :player_win
elsif dealer_hand > player_hand
  :dealer_win
elsif dealer_hand < player_hand
  :player_win
else
  :tie



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
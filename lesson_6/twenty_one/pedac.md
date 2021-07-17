## Problem: Player turn loop

## Problem: Dealer turn loop
unless hand >= dealer_stay || busted?(hand)
  hand += hit
end

  ### Sub-problem: hit
  When 


## Problem: Determining winner

## Problem: Calculating Aces


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
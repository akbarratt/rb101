require 'pry'

SUITS = ['S', 'H', 'C', 'D']
VALUES = ['A', 'K', 'Q', 'J', '10', '9', '8', '7', '6', '5', '4', '3', '2']
DEALER_STAY = 17

def prompt(msg)
  puts "=> #{msg}"
end

def generate_deck(suits, values)
  values.product(suits).map(&:join).shuffle
end

def deal_cards(deck, num_cards)
  deck.pop(num_cards)
end

def hit(deck)
  deal_cards(deck, 1) unless deck.empty?
end

def hand_value(hand)
  total = 0
  hand.each do |card|
    case card[0]
    when 'A'
      total += 11
    when 'K', 'Q', 'J', '1' # '1' is for 10, the only possible 3-digit string
      total += 10
    else
      total += card[0].to_i
    end
  end

  if bust?(total)
    aces = hand.select { |card| card[0] == 'A' }
    until aces.empty? || !bust?(total)
      total -= 10
      aces.pop
    end
  end
  total
end

def bust?(num)
  num > 21
end

def player_turn(player_hand, dealer_hand, deck)
  loop do
    game_status(player_hand, dealer_hand)
    # Once game_over is corrected, refactor 54-60 as: break if hand_value(player_hand) == 21 || bust?(hand_value(player_hand))
    if hand_value(player_hand) == 21
      prompt "You have 21!"
      break
    elsif bust?(hand_value(player_hand))
      break
    else
      answer = player_choice
      if answer == 'hit'
        prompt "You've chosen to hit."
        player_hand.concat(hit(deck))
      elsif answer == 'stay'
        prompt "You've chosen to stay."
        break
      else
        prompt "Invalid input."
      end
    end
  end
end

def game_status(player_hand, dealer_hand)
  prompt "Dealer hand: #{display_hand(dealer_hand, true)}"
  prompt "Your hand: #{display_hand(player_hand)}"
  prompt "Your points: #{hand_value(player_hand)}"
end

def player_choice
  answer = ''
  loop do
    prompt "Hit or stay?"
    answer = gets.chomp.downcase.strip
    break if answer == 'hit' || answer == 'stay'
    prompt "Sorry, that's an invalid answer!"
  end
  answer
end

def dealer_turn(hand, deck)
  until hand_value(hand) >= DEALER_STAY || bust?(hand_value(hand))
    hand.concat(hit(deck))
  end
end

def game_over(player_hand, dealer_hand)
  game_status(player_hand, dealer_hand)
  if determine_winner == :dealer_win
    prompt "Dealer win!"
  elsif determine_winner == :player_win
    prompt "You win!"
  elsif determine_winner == :tie
    prompt "It's a tie!"
  end
end

def determine_winner(player_hand, dealer_hand)
  if bust?(hand_value(player_hand)) || hand_value(dealer_hand) > hand_value(player_hand)
    :dealer_win
  elsif bust?(hand_value(dealer_hand)) || hand_value(dealer_hand) < hand_value(player_hand)
    :player_win
  else
    :tie
  end
end

def display_hand(hand, obscure=false)
  display = ''
  hand.each do |card|
    if card == hand [0] && obscure == true
      display << '??' + ' '
    elsif card == hand[-1]
      display << card
    else
      display << card + ' '
    end
  end
  display
end

def play_game
  loop do
    deck = generate_deck(SUITS, VALUES)
    prompt "Dealing..."
    sleep(1)
    player_hand = deal_cards(deck, 2)
    dealer_hand = deal_cards(deck, 2)
    player_turn(player_hand, dealer_hand, deck)
    if bust?(hand_value(player_hand))
      prompt "You busted!"
    else
      dealer_turn(dealer_hand, deck)
      if bust?(hand_value(dealer_hand))
        prompt "Dealer busted!"
      end
    end
    game_over(player_hand, dealer_hand)
    prompt "Play again?"
    answer = gets.chomp
    break if answer == 'no'
  end
end

play_game

# Notes
# Refactor bust? to be more universally useable

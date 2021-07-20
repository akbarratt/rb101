require 'pry'
require 'pry-byebug'

SUITS = ['S', 'H', 'C', 'D']
VALUES = ['A', 'K', 'Q', 'J', '10', '9', '8', '7', '6', '5', '4', '3', '2']
WINNING_LIMIT = 21
DEALER_STAY = WINNING_LIMIT - 4

def prompt(msg)
  puts "=> #{msg}"
end

def play_game(player, dealer)
  loop do
    deck = generate_deck(SUITS, VALUES)
    prompt "Dealing..."
    sleep(1)
    player[:hand] = deal_cards(deck, 2)
    player[:total] = calculate_hand_value(player)
    dealer_hand = deal_cards(deck, 2)
    player_turn(player, dealer_hand, deck)
    if bust?(player[points])
      prompt "You busted!"
    else
      prompt "Dealer is thinking..."
      sleep(1)
      dealer_turn(dealer_hand, deck)
      if bust?(hand_value(dealer_hand))
        prompt "Dealer busted!"
      end
    end
    game_over(player_hand, dealer_hand, false, true)
    prompt "Play again?"
    answer = gets.chomp
    break if answer == 'no'
  end
end

def generate_deck(suits, values)
  values.product(suits).map(&:join).shuffle
end

def deal_cards(deck, num_cards)
  deck.pop(num_cards)
end

def player_turn(player, dealer_hand, deck)
  loop do
    game_status(player, dealer_hand, true)
    break if player[:hand] == WINNING_LIMIT || bust?(player[:total])
    answer = player_choice
    if answer == 'hit'
      prompt "Drawing a card..."
      sleep(1)
      hit(player, deck)
    elsif answer == 'stay'
      prompt "You've chosen to stay."
      break
    else
      prompt "Invalid input."
    end
  end
end

def game_status(player, dealer_hand, obscure=false, dealer_point=false)
  prompt "**********"
  prompt "Dealer hand: #{display_hand(dealer_hand, obscure)}"
  prompt "Dealer points: #{hand_value(dealer_hand)}" if dealer_point == true
  prompt "Your hand: #{display_hand(player[:hand])}"
  prompt "Your points: #{player[:points]}"
  prompt "**********"
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

def calculate_hand_value(player)
  player[:hand].each do |card|
    case card[0]
    when 'A'
      player[:total] += 11
    when 'K', 'Q', 'J', '1' # '1' is for 10, the only possible 3-digit string
      player[:total] += 10
    else
      player[:total] += card[0].to_i
    end
  end
  if bust?(player[:total])
    aces = player[:hand].select { |card| card[0] == 'A' }
    until aces.empty? || !bust?(player[:total])
      player[:total] -= 10
      aces.pop
    end
  end
  player[:total]
end

def bust?(num)
  num > WINNING_LIMIT
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

def hit(player, deck)
  unless deck.empty?
    player[:hand] = deal_cards(deck, 1)
    player[:total] = calculate_hand_value(player)
end

def dealer_turn(hand, deck)
  until hand_value(hand) >= DEALER_STAY || bust?(hand_value(hand))
    hand.concat(hit(deck))
  end
end

def determine_winner(player, dealer)
  if bust?(player[:hand])
    :dealer_win
  elsif bust?(hand_value(dealer_hand))
    :player_win
  elsif hand_value(dealer_hand) > hand_value(player_hand)
    :dealer_win
  elsif hand_value(dealer_hand) < hand_value(player_hand)
    :player_win
  else
    :tie
  end
end

def game_over(player_hand, dealer_hand, obscure, dealer_point)
  game_status(player_hand, dealer_hand, obscure, dealer_point)
  if determine_winner(player_hand, dealer_hand) == :dealer_win
    prompt "Dealer wins!"
  elsif determine_winner(player_hand, dealer_hand) == :player_win
    prompt "You win!"
  elsif determine_winner(player_hand, dealer_hand) == :tie
    prompt "It's a tie!"
  end
end

player = {
  name: "You",
  hand: [],
  total: 0,
  wins: 0
}

dealer = {
  name: "Dealer",
  hand: [],
  total: 0,
  wins: 0
}

prompt "Welcome to Twenty-One!"
play_game(player, dealer)
prompt "Thank you for playing Twenty-One!"

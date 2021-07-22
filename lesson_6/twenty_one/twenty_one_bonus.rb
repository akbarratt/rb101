require 'pry'
require 'pry-byebug'

SUITS = ['S', 'H', 'C', 'D']
VALUES = ['A', 'K', 'Q', 'J', '10', '9', '8', '7', '6', '5', '4', '3', '2']
WINNING_LIMIT = 21
DEALER_STAY = WINNING_LIMIT - 4
CHAMPION_WINS = 5

def prompt(msg)
  puts "=> #{msg}"
end

def play_game(player, dealer)
  loop do
    deck = generate_deck(SUITS, VALUES)
    prompt "Dealing..."
    sleep(1)
    initialize_game(player, dealer, deck)
    player_turn(player, dealer, deck)
    if bust?(player[:total])
      prompt "You busted!"
    else
      dealer_turn(dealer, deck)
      prompt bust?(dealer[:total]) ? "Dealer busted!" : "Dealer chooses to stay."
    end
    sleep(1)
    game_over(player, dealer, false, true)
    break unless play_again?
  end
end

def initialize_game(player, dealer, deck)
  player[:hand] = deal_cards(deck, 2)
  player[:total] = calculate_hand_value(player)
  dealer[:hand] = deal_cards(deck, 2)
  dealer[:total] = calculate_hand_value(dealer)
end

def generate_deck(suits, values)
  values.product(suits).map(&:join).shuffle
end

def deal_cards(deck, num_cards)
  deck.pop(num_cards)
end

def player_turn(player, dealer, deck)
  loop do
    game_status(player, dealer, true)
    break if player[:total] == WINNING_LIMIT || bust?(player[:total])
    answer = player_choice
    if answer == 'hit'
      player_hit(player, deck)
    elsif answer == 'stay'
      prompt "You've chosen to stay."
      break
    end
  end
end

def game_status(player, dealer, obscure=false, dealer_point=false)
  prompt "**********"
  prompt "Dealer hand: #{display_hand(dealer[:hand], obscure)}"
  prompt "Dealer points: #{dealer[:total]}" if dealer_point == true
  prompt "Your hand: #{display_hand(player[:hand])}"
  prompt "Your points: #{player[:total]}"
  prompt "**********"
end

def display_hand(hand, obscure=false)
  display = ''
  hand.each do |card|
    if card == hand[0] && obscure == true
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
  player[:total] = 0
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
  adjust_aces(player) if bust?(player[:total])
  player[:total]
end

def adjust_aces(player)
  aces = player[:hand].select { |card| card[0] == 'A' }
  until aces.empty? || !bust?(player[:total])
    player[:total] -= 10
    aces.pop
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

def player_hit(player, deck)
  unless deck.empty?
    prompt "Drawing a card..."
    sleep(1)
    player[:hand].concat(deal_cards(deck, 1))
    player[:total] = calculate_hand_value(player)
    prompt "You drew: #{player[:hand].last}"
    sleep(1)
  end
end

def dealer_turn(dealer, deck)
  prompt "Dealer is thinking..."
  sleep(1)
  until dealer[:total] >= DEALER_STAY || bust?(dealer[:total])
    dealer[:hand].concat(deal_cards(deck, 1))
    prompt "Dealer draws a card: #{dealer[:hand].last}"
    dealer[:total] = calculate_hand_value(dealer)
    sleep(1)
  end
end

def determine_winner(player, dealer)
  if bust?(player[:total])
    :dealer_win
  elsif bust?(dealer[:total])
    :player_win
  elsif dealer[:total] > player[:total]
    :dealer_win
  elsif dealer[:total] < player[:total]
    :player_win
  else
    :tie
  end
end

def game_over(player, dealer, obscure, dealer_point)
  game_status(player, dealer, obscure, dealer_point)
  if determine_winner(player, dealer) == :dealer_win
    prompt "Dealer wins!"
    dealer[:wins] += 1
  elsif determine_winner(player, dealer) == :player_win
    prompt "You win!"
    player[:wins] += 1
  elsif determine_winner(player, dealer) == :tie
    prompt "It's a tie!"
  end
end

def play_again?
  answer = ''
  loop do
    prompt "Play again?"
    answer = gets.chomp.downcase.strip
    break if ['yes', 'no'].include?(answer)
    prompt "You must select 'yes' or 'no'."
  end
  answer == 'yes' ? true : false
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

system 'clear'
prompt "Welcome to Twenty-One!"
play_game(player, dealer)
prompt "Thank you for playing Twenty-One!"

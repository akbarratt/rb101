SUITS = ['S', 'H', 'C', 'D']
VALUES = ['A', 'K', 'Q', 'J', '10', '9', '8', '7', '6', '5', '4', '3', '2']
WINNING_LIMIT = 21
DEALER_STAY = WINNING_LIMIT - 4
CHAMPION_WINS = 5

def prompt(msg)
  puts "=> #{msg}"
end

def enter_to_continue
  prompt "Press enter to continue."
  gets.chomp
  system 'clear'
end

def play_game(player, dealer)
  system 'clear'
  prompt "Welcome to Twenty-One!"
  loop do
    reset_wins(player, dealer)
    loop do
      deck = generate_deck(SUITS, VALUES)
      prompt "Dealing..."
      sleep(1)
      initialize_game(player, dealer, deck)
      player_turn(player, dealer, deck)
      if bust?(player[:total])
        prompt "#{player[:name]} busted!"
      else
        dealer_turn(dealer, deck)
        dealer_turn_end(dealer)
      end
      game_over(player, dealer, false, true)
      break if champion?(player, dealer)
      enter_to_continue
    end
    prompt "#{determine_champion(player, dealer)}"
    break unless play_again?
    system 'clear'
  end
end

def reset_wins(player, dealer)
  player[:wins] = 0
  dealer[:wins] = 0
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
    prompt "#{player[:name]} has 21!" if player[:total] == WINNING_LIMIT
    break if player[:total] == WINNING_LIMIT || bust?(player[:total])
    answer = player_choice
    if answer == 'hit'
      hit(player, deck)
    elsif answer == 'stay'
      prompt "#{player[:name]} has chosen to stay."
      break
    end
  end
end

def game_status(player, dealer, obscure=true, round_end=false)
  prompt "******************************"
  prompt "#{dealer[:name]} hand: #{display_hand(dealer[:hand], obscure)}"
  prompt "#{dealer[:name]} points: #{dealer[:total]}" if round_end == true
  prompt "#{player[:name]} hand: #{display_hand(player[:hand])}"
  prompt "#{player[:name]} points: #{player[:total]}"
  prompt "******************************"
  if round_end == true
    prompt "#{dealer[:name]} has #{dealer[:wins]} wins."
    prompt "#{player[:name]} has #{player[:wins]} wins."
    prompt "The first player to 5 wins becomes the Champion."
    prompt "******************************"
  end
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

def calculate_hand_value(current_player)
  current_player[:total] = 0
  current_player[:hand].each do |card|
    case card[0]
    when 'A'
      current_player[:total] += 11
    when 'K', 'Q', 'J', '1' # '1' is for 10, the only possible 3-digit string
      current_player[:total] += 10
    else
      current_player[:total] += card[0].to_i
    end
  end
  adjust_aces(current_player) if bust?(current_player[:total])
  current_player[:total]
end

def adjust_aces(current_player)
  aces = current_player[:hand].select { |card| card[0] == 'A' }
  until aces.empty? || !bust?(current_player[:total])
    current_player[:total] -= 10
    aces.pop
  end
  current_player[:total]
end

def bust?(num)
  num > WINNING_LIMIT
end

def player_choice
  answer = ''
  loop do
    prompt "Hit or stay?"
    answer = gets.chomp.downcase.strip
    break if ['hit', 'stay'].include?(answer)
    prompt "Sorry, that's an invalid answer!"
  end
  answer
end

def hit(current_player, deck)
  unless deck.empty?
    prompt "Drawing a card..."
    sleep(1)
    current_player[:hand].concat(deal_cards(deck, 1))
    current_player[:total] = calculate_hand_value(current_player)
    prompt "#{current_player[:name]} draws a card: #{current_player[:hand].last}"
    sleep(1)
  end
end

def dealer_turn(dealer, deck)
  prompt "#{dealer[:name]} is thinking..."
  sleep(1)
  until dealer[:total] >= DEALER_STAY || bust?(dealer[:total])
    hit(dealer, deck)
  end
end

def dealer_turn_end(dealer)
  if prompt bust?(dealer[:total])
    prompt "#{dealer[:name]} busted!"
  else
    prompt"#{dealer[:name]} chooses to stay."
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

def game_over(player, dealer, obscure, round_end)
  sleep(1)
  if determine_winner(player, dealer) == :dealer_win
    prompt "#{dealer[:name]} wins!"
    dealer[:wins] += 1
  elsif determine_winner(player, dealer) == :player_win
    prompt "#{player[:name]} wins!"
    player[:wins] += 1
  elsif determine_winner(player, dealer) == :tie
    prompt "It's a tie!"
  end
  sleep(1)
  game_status(player, dealer, obscure, round_end)
end

def play_again?
  answer = ''
  loop do
    prompt "Play again?"
    answer = gets.chomp.downcase.strip
    break if ['yes', 'no'].include?(answer)
    prompt "You must select 'yes' or 'no'."
  end
  true if answer == 'yes'
end

def determine_champion(player, dealer)
  return "#{player[:name]} is the champion!" if player[:wins] == 5
  return "#{dealer[:name]} is the champion!" if dealer[:wins] == 5
  nil
end

def champion?(player, dealer)
  !!determine_champion(player, dealer)
end

player = {
  name: "Player",
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
play_game(player, dealer)
prompt "Thank you for playing Twenty-One!"

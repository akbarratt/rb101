require 'pry'
require 'pry-byebug'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals
INITIAL_MARKER = ' '
COIN = ['HEADS', 'TAILS']

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(array, delimiter = ',', word = 'or')
  case array.size
  when 0..1 then array.join
  when 2 then array.join(" #{word} ")
  else
    *list_items, final_item = array
    list_items.join("#{delimiter} ") + "#{delimiter} #{word} #{final_item}"
  end
end

def play_game(user, com)
  user[:wins], com[:wins] = [0, 0]
  current_player = coin_toss(user, com)
  gameplay_loop(current_player, user, com)
  prompt "#{detect_champion(user, com)[:name]} is the Grand Champion!"
end

def initialize_game(user, com)
  prompt 'Welcome to Tic Tac Toe!'
  user[:name] = get_user_name
  tokens = generate_tokens(user)
  choose_user_token(user, tokens)
  choose_com_token(user, com)
end

def get_user_name
  name = ''
  loop do
    prompt 'Please enter your name:'
    name = gets.chomp
    break unless name.empty?
  end
  name
end

def generate_tokens(user)
  tokens = ['X', 'O']
  unless tokens.include?(user[:name][0].upcase)
    tokens << user[:name][0].upcase
  end
  tokens
end

def choose_user_token(user, tokens)
  loop do
    prompt "Select a token: #{joinor(tokens)}."
    user[:token] = gets.chomp.upcase
    break if tokens.include?(user[:token])
    prompt "Invalid input."
  end
end

def choose_com_token(user, com)
  if user[:token] == 'C' || user[:token] == 'O'
    com[:token] = 'X'
  elsif user[:token] == 'X'
    com[:token] = 'O'
  else
    com[:token] = 'C'
  end
end

def coin_toss(user, com)
  user_coin = ''
  prompt 'We will toss a coin to determine who plays first.'
  user_coin = choose_side(user_coin)
  prompt "You have chosen #{user_coin}."
  prompt "Tossing coin..."
  coin_results = COIN.sample
  sleep(1)
  prompt "It's #{coin_results}!"
  winner = (user_coin == coin_results) ? user : com
  prompt "#{winner[:name]} goes first."
  sleep(1)
  winner
end

def choose_side(user_coin)
  loop do
    prompt "Choose a side, #{joinor(COIN)}."
    user_coin = gets.chomp.upcase
    return user_coin if COIN.include?(user_coin)
    prompt 'Invalid response.'
  end
end

def gameplay_loop(current_player, user, com)
  loop do
    board = initialize_board
    turn_loop(current_player, board, user, com)
    game_over(board, user, com)
    current_player = detect_winner(board, user, com) if someone_won?(board, user, com)
    break if grand_champion?(user, com)
    sleep(1) # Replace with press key to continue
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def turn_loop(current_player, brd, user, com)
  loop do
    display_board(brd, user, com)
    place_piece!(current_player, brd, user, com)
    current_player = alternate_player(current_player, user, com)
    break if game_over?(brd, user, com)
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, user, com)
  system 'clear'
  prompt "#{user[:name]} is \"#{user[:token]}\" with #{user[:wins]} win(s). #{com[:name]} is \"#{com[:token]}\" with #{com[:wins]} win(s)."
  prompt "First to 5 wins is the Grand Champion!"
  # Prompt rules first to 5 winds
  # Prompt current wins for 
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def place_piece!(current_player, brd, user, com)
  if current_player == user
    user_places_piece!(brd, user)
  else
    computer_places_piece!(brd, com)
  end
end

def user_places_piece!(brd, user)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = user[:token]
end

def computer_places_piece!(brd, com)
  square = empty_squares(brd).sample
  brd[square] = com[:token]
end

def alternate_player(current_player, user, com)
  current_player == user ? current_player = com : current_player = user
end

def game_over?(brd, user, com)
  someone_won?(brd, user, com) || board_full?(brd)
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd, user, com)
  !!detect_winner(brd, user, com)
end

def game_over(brd, user, com)
  if someone_won?(brd, user, com)
    winner = detect_winner(brd, user, com)
    increment_winner(winner)
    display_board(brd, user, com)
    display_winner(winner)
  else
    display_board(brd, user, com)
    prompt "It's a tie!"
  end
end

def detect_winner(brd, user, com)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(user[:token]) == 3
      return user
    elsif brd.values_at(*line).count(com[:token]) == 3
      return com
    end
  end
  nil
end

def display_winner(winner)
  prompt "#{winner[:name]} won!"
end

def increment_winner(winner)
  winner[:wins] +=1
  prompt "#{winner[:name]} has won #{winner[:wins]} time(s)!" # could improve this to use time/times
end

def grand_champion?(user, com)
  !!detect_champion(user, com)
end

def detect_champion(user, com)
  if user[:wins] == 5
    user
  elsif com[:wins] == 5
    com
  else
    nil
  end
end

def play_again?(user)
  loop do
    prompt "Would you like to play again, #{user[:name]}? (y/n)"
    answer = gets.chomp
    return answer == 'y' ? true : false
    # add validation
  end
end # struggling with this validation and loop, review video

user = {
  name: '',
  token: '',
  wins: 0,
}
com = {
  name: 'Computer',
  token: '',
  wins: 0,
}

initialize_game(user, com)
loop do
  play_game(user, com)
  break if play_again?(user) == false
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"

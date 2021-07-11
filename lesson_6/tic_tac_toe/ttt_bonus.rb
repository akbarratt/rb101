WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals
WINNING_MARKERS = 3
THREATENED_MARKERS = 2
INITIAL_MARKER = ' '
COIN = ['HEADS', 'TAILS']
GRAND_CHAMPION_SCORE = 5
PLAY_AGAIN_VALUES = ['YES', 'NO']
CENTER_SQUARE = 5

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

def initialize_game(user, com)
  system 'clear'
  prompt 'Welcome to Tic Tac Toe!'
  user[:name] = set_user_name
  tokens = generate_tokens(user)
  choose_user_token(user, tokens)
  com[:token] = choose_com_token(user)
end

def set_user_name
  name = ''
  loop do
    prompt 'Please enter your name:'
    name = gets.chomp.lstrip
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

def choose_com_token(user)
  if user[:token] == 'C' || user[:token] == 'O'
    'X'
  elsif user[:token] == 'X'
    'O'
  else
    'C'
  end
end

def play_game(user, com)
  system 'clear'
  user[:wins] = 0
  com[:wins] = 0
  current_player = coin_toss(user, com)
  gameplay_loop(current_player, user, com)
  prompt "#{detect_champion(user, com)[:name]} is the Grand Champion!"
end

def coin_toss(user, com)
  prompt 'We will toss a coin to determine who plays first.'
  user_coin = choose_side(user_coin)
  prompt "You have chosen #{user_coin}."
  prompt "Tossing coin..."
  sleep(1)
  coin_results = COIN.sample
  prompt "It's #{coin_results}!"
  winner = user_coin == coin_results ? user : com
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
    current_player = if someone_won?(board, user, com)
                       detect_winner(board, user, com)
                     else
                       alternate_player(current_player, user, com)
                     end
    break if grand_champion?(user, com)
    sleep(1)
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

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, user, com)
  system 'clear'
  prompt "#{user[:name]} is \"#{user[:token]}\" with #{user[:wins]} win(s)."
  prompt "#{com[:name]} is \"#{com[:token]}\" with #{com[:wins]} win(s)."
  prompt "First to 5 wins is the Grand Champion!"
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
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def place_piece!(current_player, brd, user, com)
  if current_player == user
    user_places_piece!(brd, user)
  elsif current_player == com
    computer_places_piece!(brd, user, com)
  end
end

def user_places_piece!(brd, user)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp
    # Should not accept strings such as "2%"
    break if empty_squares(brd).include?(square.to_i) &&
             square.to_i.to_s == square
    prompt "Sorry, that's not a valid choice."
  end
  square = square.to_i
  brd[square] = user[:token]
end

def computer_places_piece!(brd, user, com)
  square = if square_threatened?(brd, com)
             defend_square(brd, com)
           elsif square_threatened?(brd, user)
             defend_square(brd, user)
           elsif brd[CENTER_SQUARE] == ' '
             CENTER_SQUARE
           else
             empty_squares(brd).sample
           end
  brd[square] = com[:token]
end

def square_threatened?(brd, player)
  !!defend_square(brd, player)
end

def defend_square(brd, player)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(player[:token]) == THREATENED_MARKERS &&
       brd.values_at(*line).include?(INITIAL_MARKER)
      brd.select do |k, v|
        if line.include?(k) && v == INITIAL_MARKER
          return k
        end
      end
    end
  end
  nil
end

def alternate_player(current_player, user, com)
  current_player == user ? com : user
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
    if brd.values_at(*line).count(user[:token]) == WINNING_MARKERS
      return user
    elsif brd.values_at(*line).count(com[:token]) == WINNING_MARKERS
      return com
    end
  end
  nil
end

def display_winner(winner)
  prompt "#{winner[:name]} won!"
end

def increment_winner(winner)
  winner[:wins] += 1
  prompt "#{winner[:name]} has won #{winner[:wins]} time(s)!"
end

def grand_champion?(user, com)
  !!detect_champion(user, com)
end

def detect_champion(user, com)
  if user[:wins] == GRAND_CHAMPION_SCORE
    user
  elsif com[:wins] == GRAND_CHAMPION_SCORE
    com
  end
end

def play_again(user)
  answer = ''
  prompt "Would you like to play again, #{user[:name]}?"
  prompt "#{joinor(PLAY_AGAIN_VALUES)}?"
  loop do
    answer = gets.chomp.upcase
    break if PLAY_AGAIN_VALUES.include?(answer)
    prompt "Invalid response. Please select #{joinor(PLAY_AGAIN_VALUES)}."
  end
  answer
end

user = {
  name: '',
  token: '',
  wins: 0
}
com = {
  name: 'Computer',
  token: '',
  wins: 0
}

initialize_game(user, com)
loop do
  play_game(user, com)
  break if play_again(user) == 'NO'
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"

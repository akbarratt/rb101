require 'pry'

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

def initialize_game(current_player, user, com)
  tokens = ['X', 'O']
  prompt 'Welcome to Tic Tac Toe!'
  prompt 'Please enter your name:'
  user[:name] = gets.chomp # if valid, else loop
  unless tokens.include?(user[:name][0].upcase)
    tokens << user[:name][0].upcase
  end
  choose_user_token(user, tokens)
  choose_com_token(user, com, tokens)
  coin_toss(current_player, user, com)
end

def choose_user_token(user, tokens)
  loop do
    prompt "Select a token: #{joinor(tokens)}."
    user[:token] = gets.chomp
    break if tokens.include?(user[:token].upcase)
    prompt "Invalid input."
  end
end

def choose_com_token(user, com, tokens)
  case user[:token]
  when tokens[2] then com[:token] = 'C'
  when 'X' then com[:token] = 'O'
  else com[:token] = 'X'
  end
  # Bug: need to add computer selection if user token is 'C'
end

def coin_toss(current_player, user, com)
  prompt 'We will toss a coin to determine who plays first.'
  prompt "Choose a side, #{joinor(COIN)}."
  user_coin = gets.chomp.upcase
  unless COIN.include?(user_coin)
    prompt 'Invalid response. Assigning a side...'
    sleep(1)
    user_coin = COIN.sample
  end
  prompt "You have chosen #{user_coin}."
  prompt "Tossing coin..."
  sleep(1)
  coin_results = COIN.sample
  prompt "It's #{coin_results}!"
  current_player = (user_coin == coin_results) ? user : com
  prompt "#{current_player[:name]} will go first."
  sleep(1)
end

def game_loop(current_player, user, com)
  loop do
    board = initialize_board
    turn_loop(current_player, board, user, com)
    display_board(board, user, com)
    if someone_won?(board, user, com)
      winner = detect_winner(board, user, com)
      prompt "#{winner[:name]} won!"
      winner[:wins] +=1
      prompt "#{winner[:name]} has won #{winner[:wins]} time(s)!"
      # current_player = winner
    else
      prompt "It's a tie!"
    end
    prompt "Play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
end

def turn_loop(current_player, brd, user, com)
  loop do
    display_board(brd, user, com)
    place_piece!(current_player, brd, user, com)
    current_player = alternate_player(current_player, user, com)
    break if someone_won?(brd, user, com) || board_full?(brd)
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, user, com)
  system 'clear'
  puts "You're #{user[:token]}. Computer is #{com[:token]}."
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

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def place_piece!(current_player, board, user, com)
  if current_player == user
    user_places_piece!(board, user)
  else
    computer_places_piece!(board, com)
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

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd, user, com)
  !!detect_winner(brd, user, com)
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

current_player = 

initialize_game(current_player, user, com)
game_loop(current_player, user, com)
# Check for grand champion here, unless grand_champion?

prompt "Thanks for playing Tic Tac Toe! Good bye!"

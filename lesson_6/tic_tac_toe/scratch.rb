require 'pry'
COIN = ['HEADS', 'TAILS']
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

user = {
  name: 'Andi',
  token: 'X',
  wins: 0,
  turns: 0
}
com = {
  name: 'COM',
  token: 'O',
  wins: 0,
  turns: 0
}

board = {1=>" ",
2=>" ",
3=>" ",
4=>" ",
5=>" ",
6=>" ",
7=>" ",
8=>" ",
9=>" "}

current_player = user

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

def place_piece!(current_player, board, user, com)
  if current_player == user
    user_places_piece!(board, user)
  else
    computer_places_piece!(board, com)
  end
end

def computer_places_piece!(brd, com)
  square = empty_squares(brd).sample
  brd[square] = com[:token]
end

def alternate_player(current_player, user, com)
  current_player == user ? current_player = com : current_player = user
end

def turn_loop(current_player, user, com)
  loop do
    display_board(board, user, com)
    place piece!(current_player, board, user, com)
    current_player = alternate_player(current_player, user, com)
    break if someone_won?(board, user, com) || board_full?(board)
  end
end

puts current_player
puts alternate_player(current_player, user, com)


# def coin_toss(user, com)
#   prompt 'We will toss a coin to determine who plays first.'
#   prompt "Choose a side, #{joinor(COIN)}."
#   user_coin = gets.chomp.upcase
#   unless COIN.include?(user_coin)
#     prompt 'Invalid response. Assigning a side...'
#     sleep(1)
#     user_coin = COIN.sample
#   end
#   prompt "You have chosen #{user_coin}."
#   prompt "Tossing coin..."
#   sleep(1)
#   coin_results = COIN.sample
#   prompt "It's #{coin_results}!"
#   if user_coin == coin_results
#     prompt "You go first, #{user[:name]}."
#     # set player to have first turn
#   else
#     prompt "The computer goes first."
#     # set computer to have first turn
#   end
# end

# def grand_champion?
#   !!check_for_grand_champion(user, com)
# end

# def check_for_grand_champion(user, com)
#   if user[:wins] == 5
#     prompt "#{user[:name]} is the Grand Champion!"
#   elsif com[:wins] == 5
#     prompt "Computer is the Grand Champion!"
#   end
#   nil
# end


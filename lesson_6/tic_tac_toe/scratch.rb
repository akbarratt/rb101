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

board = {1=>"X",
2=>"X",
3=>"X",
4=>" ",
5=>" ",
6=>" ",
7=>" ",
8=>" ",
9=>" "}

def someone_won?(brd, user, com)
  true
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

someone_won?(board, user, com) || board_full?(board)
if someone_won?(board, user, com)
  prompt "#{detect_winner(board, user, com)[:name]} won!"
  detect_winner(board, user, com)[:wins] +=1
  prompt "#{detect_winner(board, user, com)[:name]} has won #{detect_winner(board, user, com)[:wins]} time(s)!"
else
  prompt "It's a tie!"
end


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


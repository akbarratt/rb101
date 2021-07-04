COIN = ['HEADS', 'TAILS']

user = {
  name: '',
  token: '',
  wins: 0,
  turns: 0
}
com = {
  name: '',
  token: '',
  wins: 0,
  turns: 0
}



def coin_toss(user, com)
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
  if user_coin == coin_results
    prompt "You go first, #{user[:name]}."
    # set player to have first turn
  else
    prompt "The computer goes first."
    # set computer to have first turn
  end
end
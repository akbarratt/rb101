COIN = ['HEADS', 'TAILS']

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(array, delimiter = ',', word = 'or')
  case array.size
  when 0..1 then return array.join
  when 2 then array.join(" #{word} ")
  else
    *list_items, final_item = array
    list_items.join("#{delimiter} ") + "#{delimiter} #{word} #{final_item}"
  end
end

def coin_toss
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
    prompt "You go first, #PLAYERNAME." # placeholder
    # set player to have first turn
  else
    prompt "The computer goes first."
    #set computer to have first turn
  end
end

coin_toss
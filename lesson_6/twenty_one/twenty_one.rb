SUITS = ['S', 'H', 'C', 'D']
VALUES = ['A', 'K', 'Q', 'J', '10', '9', '8', '7', '6', '5', '4', '3', '2']
DEALER_STAY = 17

def prompt(msg)
  puts "=> #{msg}"
end

def generate_deck(suits, values)
  deck = values.map do |value|
          suits.map do |suit|
            value + suit
          end
        end
  deck.flatten.shuffle
end

def deal_cards(deck, num_cards)
  deck.pop(num_cards)
end

def hit(deck)
  deal_cards(deck, 1) unless deck.empty?
end

def hand_value(hand)
  total = 0
  hand.each do |card|
    case card[0]
    when 'A'
      total += 11
    when 'K', 'Q', 'J', '1' # '1' is for for 10, the only possible 3-digit string
      total += 10
    else
      total += card[0].to_i
    end
  end

  if bust?(total)
    aces = hand.select do |card|
            card[0] == 'A'
           end
    until aces.empty? || !bust?(total)
      total -= 10
      aces.pop
    end
  end
  total
end

def bust?(num)
  num > 21
end

def player_turn(hand, deck)
  if hand_value(hand) == 21
    p hand
    prompt "You have 21!"
  else
    until bust?(hand_value(hand))
      p hand
      p hand_value(hand)
      answer = player_choice
      if answer == 'hit'
        prompt "You've chosen to hit."
        hand.concat(hit(deck))
      elsif answer == 'stay'
        prompt "You've chosen to stay."
        break
      end
    end
  end
end

def player_choice
  answer = ''
  loop do
    prompt "Hit or stay?"
    answer = gets.chomp
    break if answer == 'hit' || answer == 'stay'
    prompt "Sorry, that's an invalid answer!"
  end
  answer
end

def dealer_turn(hand, deck)
  until hand_value(hand) >= DEALER_STAY || bust?(hand_value(hand))
    hand.concat(hit(deck))
  end
end

deck = generate_deck(SUITS, VALUES)
player_hand = deal_cards(deck, 2)
player_turn(player_hand, deck)
p hand_value(player_hand)
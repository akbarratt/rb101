SUITS = ['S', 'H', 'C', 'D']
VALUES = ['A', 'K', 'Q', 'J', '10', '9', '8', '7', '6', '5', '4', '3', '2']
DEALER_STAY = 17

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

def bust?(total)
  total > 21
end

def dealer_turn(hand, deck)
  until hand_value(hand) >= DEALER_STAY || bust?(hand_value(hand))
    hand.concat(hit(deck))
  end
end

deck = generate_deck(SUITS, VALUES)
player_hand = deal_cards(deck, 2)
p player_hand
dealer_turn(player_hand, deck)
p player_hand
p hand_value(player_hand)
dealer_hand = deal_cards(deck, 2)
p dealer_hand
dealer_turn(dealer_hand, deck)
p dealer_hand
p hand_value(dealer_hand)
VALID_CHOICES = %w(rock paper scissors lizard spock)

WIN_CONDITIONS = {
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'rock' => %w(scissors lizard),
  'lizard' => %w(paper spock),
  'spock' => %w(scissors rock)
}

CHAMP_SCORE = 5

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(player, opponent)
  WIN_CONDITIONS[player].include?(opponent)
end

def display_match_result(human, computer)
  if win?(human, computer)
    prompt("You won!")
  elsif win?(computer, human)
    prompt("The computer won!")
  else
    prompt("It's a tie!")
  end
end

def display_score(player, opponent)
  prompt("Your wins: #{player}")
  prompt("Computer wins: #{opponent}")
end

prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock!")
prompt("The first player to reach #{CHAMP_SCORE} wins becomes GRAND CHAMPION!")

loop do
  player_score = 0
  computer_score = 0
  loop do
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = Kernel.gets().chomp()

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_match_result(choice, computer_choice)
    player_score += 1 if win?(choice, computer_choice)
    computer_score += 1 if win?(computer_choice, choice)
    display_score(player_score, computer_score)

    if player_score == CHAMP_SCORE
      prompt("Congratulations! You are the GRAND CHAMPION!")
      break
    elsif computer_score == CHAMP_SCORE
      prompt("Game over! The computer is the GRAND CHAMPION!")
      break
    else
      next
    end
  end
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")

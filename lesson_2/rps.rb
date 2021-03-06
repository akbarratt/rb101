# Notes: working on abbreviated choices

VALID_CHOICES = %w(rock paper scissors lizard spock)

ABBREVIATIONS = %w(r p sc l sp)

WIN_CONDITIONS = {
  'paper' => %w(rock spock r sp),
  'scissors' => %w(paper lizard p l),
  'rock' => %w(scissors lizard sc l),
  'lizard' => %w(paper spock p sp),
  'spock' => %w(scissors rock sc r),
  'p' => %w(rock spock r sp),
  'sc' => %w(paper lizard p l),
  'r' => %w(scissors lizard sc l),
  'l' => %w(paper spock p sp),
  'sp' => %w(scissors rock sc r)
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

loop do
  system("clear")
  prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock!")
  prompt("The first player to reach #{CHAMP_SCORE} wins becomes GRAND CHAMPION!")
  player_score = 0
  computer_score = 0
  loop do
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')} (r p sc l sp)")
      choice = Kernel.gets().chomp()

      if VALID_CHOICES.include?(choice) || ABBREVIATIONS.include?(choice)
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

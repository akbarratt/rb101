VALID_CHOICES = %w(rock paper scissors lizard spock)

WIN_CONDITIONS = {
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'rock' => %w(scissors lizard),
  'lizard' => %w(paper spock),
  'spock' => %w(scissors rock)
}

WINNING_SCORE = 5

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(player, opponent)
  WIN_CONDITIONS[player].include?(opponent)
end

def display_result(human, computer)
  if win?(human, computer)
    prompt("You won!")
  elsif win?(computer, human)
    prompt("The computer won!")
  else
    prompt("It's a tie!")
  end
end

prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock!")
prompt("The first player to reach ")

loop do
  player_score = 0
  computer_score = 0
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

  display_result(choice, computer_choice)
  # computer_score += 1 if "computer win"
  # player_score += 1 if "player win"
  # puts computer_score
  # puts player_score

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")

VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_result(player, computer)
  win_conditions = {
    'paper' => %w(rock spock),
    'scissors' => %w(paper lizard),
    'rock' => %w(scissors lizard),
    'lizard' => %w(paper spock),
    'spock' => %w(scissors rock)
  }

  if player == computer
    prompt("It's a tie!")
    return "computer win"
  elsif win_conditions[player].include?(computer)
    prompt("You win!")
    return "player win"
  else
    prompt("The computer wins!")
  end
end

prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock!")

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
  computer_score += 1 if "computer win"
  player_score += 1 if "player win"
  puts computer_score
  puts player_score

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")

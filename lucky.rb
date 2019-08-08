@scoring_card = {}

def set_default_values
  @secret_number = rand(0000..9999)
  @previous_attempts = []
  @number_of_tries = 0
  @chances = 8
end

def ask_for_name
  puts "\n\nWhat's your name?\n\n"
  return gets.chomp
end

def ask_for_number
  puts "Pick number between 0000 and 9999:"
  return gets.to_i
end

def run_game
  set_default_values
  puts "\n\nWELCOME TO LUCKY 4D\n\n"

  puts "==Guess The Number=="
  puts "You have #{@chances} chances to win this game."
  puts "Secret: #{@secret_number}"
  @player_name = ask_for_name

  loop do
    @number_of_tries += 1
    @guessed_number = ask_for_number
    @previous_attempts << @guessed_number
    balances = @chances - @number_of_tries

    puts "You have #{balances} of chances left."

    if @secret_number > @guessed_number
      puts "Your number was TOO SMALL."
    elsif @secret_number < @guessed_number
      puts "Your number was TOO BIG."
    else
      puts "#{@player_name}, you got the RIGHT NUMBER!"
      puts "You tried #{@number_of_tries} times."
      puts "Your tries were: #{@previous_attempts.join(', ')}."

      add_score(@player_name, @number_of_tries)
      break
    end

    break if balances.zero?
  end

  print_leaderboard
  prompt_replay
end

def add_score(player, score)
  @scoring_card[player] = score
end

def print_leaderboard
  puts "\n\nGAME LEADERS\n\n"

  @scoring_card.sort_by(&:last).each do |player, score|
    puts "#{player} won in #{score} tries"
  end

  puts "\n\nEND\n\n"
end

def prompt_replay
  puts "Do you want to play again?"
  puts "Y - Yes"
  puts "N - No"

  answer = gets.chomp
  if answer == 'Y'
    run_game
  elsif answer == 'N'
    exit
  else
    prompt_replay
  end
end

run_game

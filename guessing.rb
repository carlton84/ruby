@scoring_card = {}

def set_default_values(maximum_number=10)
  @maximum_number = maximum_number
  @secret_number = rand(1..maximum_number)
  @previous_attempts = []
  @number_of_tries = 0
  @chances = 6
end

def ask_for_name
  puts "What's your name?"
  return gets.chomp
end

def set_preferred_level
  puts "Choose Level"
  puts "1 - Easy"
  puts "2 - Medium"
  puts "3 - Hard"
  puts "0 - Exit"

  choice = gets.to_i

  if choice == 1
    set_default_values(10)
  elsif choice == 2
    set_default_values(50)
  elsif choice == 3
    set_default_values(100)
  elsif choice == 0
    exit
  end
end

def ask_for_number
  puts "Pick number between 0 and #{@maximum_number}:"
  return gets.to_i
end

def run_game
  puts "Welcome To Guess The Number Game"
  @player_name = ask_for_name

  set_preferred_level

  puts "You have #{@chances} chances to win this game."
  puts "Secret: #{@secret_number}"

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
  if answer.upcase == 'Y'
    run_game
  else
    exit
  end
end

run_game

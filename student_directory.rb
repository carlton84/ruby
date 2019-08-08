@students = []


def data_input
  @students.each do |obj|
    File.open("student_directory.csv", "a") { |file| file.puts "#{obj[:name]}, #{obj[:age]}, #{obj[:gender]}" }
  end
end


def input_students_msg
  puts "Please enter student name"
  puts "To finish, just hit return"
end

def input_age_msg
  puts "please enter student age"
  puts "To finish, just hit return"
end

def input_gender_msg
  puts "please enter student gender"
  puts "To finish, just hit return"
end

# loop do

def user_input_msg
  input_students_msg
  name = gets.chomp

  input_age_msg
  age = gets.chomp

  input_gender_msg
  gender = gets.chomp

  @students << {name: name, age: age, gender: gender}
  puts "Now we have #{@students.count} students"
  data_input
end

# def prompt_entry
#   puts "do you want to add more student?"
#   puts "Y - Yes"
#   puts "N - No"
#
#   answer = gets.chomp
#   if answer == Y
#     user_input_msg
#   else
#     exit
#    end
 # end
# end
user_input_msg
print(@students)

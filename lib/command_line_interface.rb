#require "pry"

def welcome
  puts "Welcome to the Star Wars Character Finder!"
end

def get_character_from_user
  puts "please enter a character"
  character_name = gets.downcase.chomp
  #binding.pry
  # use gets to capture the user's input. This method should return that input, downcased.
end
#welcome
#get_character_from_user

def welcome
  # puts out a welcome message here!
  puts "Welcome!"
end

def get_character_from_user
  puts "please enter a character name"
  value = gets.strip.downcase
  value
  # use gets to capture the user's input. This method should return that input, downcased.
end

def get_title_from_user
  puts "pleas enter a title"
  value = gets.strip.downcase
  value
end

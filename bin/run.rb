#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
# character = get_character_from_user
# show_character_movies(character)

movie = get_title_from_user
get_movies_from_title(movie)




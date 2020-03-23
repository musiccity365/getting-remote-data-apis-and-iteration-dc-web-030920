require 'rest-client'
require 'json'
require 'pry'
require 'awesome_print'

def turn_to_hash(link)
  ac = RestClient.get(link)
  rh = JSON.parse(ac)
  rh
end

def get_character_movies_from_api(character_name)
  #make the web request
  #binding.pry 

  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(all_characters)
  response_hash = turn_to_hash('http://www.swapi.co/api/people/')

  found_character = response_hash["results"].find {|character| character["name"].downcase == character_name }
 
  character_movies = found_character["films"]
  
  arr = []
  character_movies.each{ |cm|
  movie = RestClient.get(cm)
  arr <<  JSON.parse(movie)
}

  arr 
  
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  count = 1
  films.each do |films|
    puts "#{count}. #{films["title"]}"
  count += 1
  end
end

def show_character_movies(character)
  puts "Searching for #{character}..."
  films = get_character_movies_from_api(character)
  print_movies(films)
end


def get_movies_from_title(title)

  response_hash = turn_to_hash('http://www.swapi.co/api/films/')

  found_movie = response_hash["results"].find {|movie| movie["title"].downcase == title }

  binding.pry 
  found_movie 
 


end 

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  # binding.pry

  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  characters_hash = JSON.parse(all_characters)
  #binding.pry
  characters_array = characters_hash["results"]
  target_character = characters_array.find do |person|
    person["name"].downcase.include?(character)
  end
# binding.pry
  film_urls = target_character["films"]
  film_urls.collect do |url|
    film_json = RestClient.get(url)
    JSON.parse(film_json)
    #binding.pry
  end
  #if character_hash["name"] == character
  #  character_films = character_hash["films"]
  #end

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character) #films_hash is an array of hashes
  parse_character_movies(films_hash)
  #binding.pry
end

def parse_character_movies(films_hash_array)
  # some iteration magic and puts out the movies in a nice list
  films_hash_array.collect do |movie|
    puts movie["title"]
  end
end

#parse_character_movies("Luke Skywalker")
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

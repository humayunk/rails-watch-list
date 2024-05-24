# Clear existing movie-related data
Bookmark.where(movie_id: Movie.pluck(:id)).delete_all
Movie.delete_all
List.delete_all

# # Create Lists (if they don't already exist)
# lists = [
#   { name: 'Drama' }
# ]

# lists.each do |list|
#   List.find_or_create_by!(list)
# end

# Create Movies
require 'net/http'
require 'json'

API_KEY = 'd238b4128c2101bc306d0a254501ba88'
BASE_URL = 'https://api.themoviedb.org/3'

def fetch_movies(page)
  url = "#{BASE_URL}/movie/popular?api_key=#{API_KEY}&language=en-US&page=#{page}"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)['results']
end

def movie_data(movie)
  return if movie['overview'].blank? || movie['poster_path'].blank?

  {
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/original/#{movie['poster_path']}",
    rating: movie['vote_average']
  }
end

movies = []
(1..5).each do |page|
  movies += fetch_movies(page).map { |movie| movie_data(movie) }.compact
end

movies.each do |movie|
  next if Movie.exists?(title: movie[:title])
  Movie.create!(movie)
end

# # Create Bookmarks
# bookmarks = [
#   { comment: 'Recommended by John', movie: Movie.find_by(title: 'Titanic'), list: List.find_by(name: 'All time favourites') },
#   { comment: 'Superhero movie revisited in 2020', movie: Movie.find_by(title: 'Wonder Woman 1984'), list: List.find_by(name: 'Girl Power') },
#   { comment: 'Spielberg\'s masterly Oscar-winning drama', movie: Movie.find_by(title: 'The Shawshank Redemption'), list: List.find_by(name: 'Drama') },
#   { comment: '2020 release', movie: Movie.find_by(title: 'Ocean\'s Eight'), list: List.find_by(name: 'Drama') },
#   { comment: 'Based on Stephen King\'s 1996 novel', movie: Movie.find_by(title: 'The Green Mile'), list: List.find_by(name: 'All time favourites') }
# ]

# bookmarks.each do |bookmark|
#   Bookmark.create!(bookmark)
# end

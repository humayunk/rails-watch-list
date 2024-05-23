# Clear existing data
Bookmark.delete_all
Movie.delete_all
List.delete_all

# Create Lists
lists = [
  { name: 'Drama' },
  { name: 'All time favourites' },
  { name: 'Girl Power' }
]

lists.each do |list|
  List.create!(list)
end

# Create Movies
movies = [
  { title: 'Wonder Woman 1984', overview: 'Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s.', poster_url: 'https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg', rating: 6.9 },
  { title: 'The Shawshank Redemption', overview: 'Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison.', poster_url: 'https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg', rating: 8.7 },
  { title: 'Titanic', overview: '101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.', poster_url: 'https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg', rating: 7.9 },
  { title: 'The Green Mile', overview: 'A supernatural tale set on death row in a Southern prison.', poster_url: 'https://image.tmdb.org/t/p/original/velWPhVMQeQKcxggNEU8Ymlo52R.jpg', rating: 8.5 },
  { title: 'Ocean\'s Eight', overview: 'Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.', poster_url: 'https://image.tmdb.org/t/p/original/MvYpKlpFivIivhEPmY1rPsddqHO.jpg', rating: 7.0 }
]

movies.each do |movie|
  Movie.create!(movie)
end

# Create Bookmarks
bookmarks = [
  { comment: 'Recommended by John', movie: Movie.find_by(title: 'Titanic'), list: List.find_by(name: 'All time favourites') },
  { comment: 'Superhero movie revisited in 2020', movie: Movie.find_by(title: 'Wonder Woman 1984'), list: List.find_by(name: 'Girl Power') },
  { comment: 'Spielberg\'s masterly Oscar-winning drama', movie: Movie.find_by(title: 'The Shawshank Redemption'), list: List.find_by(name: 'Drama') },
  { comment: '2020 release', movie: Movie.find_by(title: 'Ocean\'s Eight'), list: List.find_by(name: 'Drama') },
  { comment: 'Based on Stephen King\'s 1996 novel', movie: Movie.find_by(title: 'The Green Mile'), list: List.find_by(name: 'All time favourites') }
]

bookmarks.each do |bookmark|
  Bookmark.create!(bookmark)
end

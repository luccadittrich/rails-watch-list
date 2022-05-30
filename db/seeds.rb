# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.create!(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create!(title: "The Shawshank Redemption", overview: "Framed in the 1940s for  in Little Whinging. Later, he finds out that the Ministry of Magic is in denial of Lord Voldemort's return.", poster_url: "https://www.imdb.com/title/tt0330373/mediaviewer/rm436509952/?ref_=tt_ov_i", rating: 6.9)
Movie.create!(title: "Harry Potter and the Half-Blood Prince", overview: "In Harry's sixth year at Hogwarts, Lord Voldemort and his Death Eaters are increasing their terror upon the Wizarding and Muggle worlds. ", poster_url: "", rating: 7.1)
Movie.create!(title: "Harry Potter and the Deathly Hallows – Part 1", overview: "After unexpected events at the end ofdouble murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "", rating: 8.7)
Movie.create!(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "", rating: 7.9)
Movie.create!(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "", rating: 7.0)
# Movie.create!(title: "Harry Potter and the Philosopher's Stone", overview: "Harry Potter is an orphaned boy brought up by his unkind Muggle (non-magical) aunt and uncle.", rating: 7.2)
# Movie.create!(title: "Harry Potter and the Chamber of Secrets", overview: "Harry, Ron, and Hermione return to Hogwarts for their second year.", poster_url: "", rating: 7.0)
# Movie.create!(title: "Harry Potter and the Prisoner of Azkaban", overview: "Harry's third year sees the boy wizard, along with his friends, attending Hogwarts School once again.", poster_url: "", rating: 7.2)
# Movie.create!(title: "Harry Potter and the Goblet of Fire", overview: "Harry's third year sees the boy wizard, along with his friends, attending Hogwarts School once again.", poster_url: "", rating: 7.8)
# Movie.create!(title: "Harry Potter and the Order of the Phoenix", overview: "Harry's fifth year begins with him being attacked by Dementors the previous year, Harry, Ron, and Hermione are entrusted with a quest to find and destroy Lord Voldemort's secret to immortality – the Horcruxes.", poster_url: "", rating: 7.0)
# Movie.create!(title: "Harry Potter and the Deathly Hallows – Part 2", overview: "After destroying one Horcrux and discovering the significance of the three Deathly Hallows, Harry, Ron and Hermione continue to seek the other Horcruxes in an attempt to destroy Voldemort, who has now obtained the powerful Elder Wand.", poster_url: "", rating: 8.3)
puts "Cleaning up database..."
Movie.destroy_all
puts "Database cleaned"

url = "http://tmdb.lewagon.com/movie/top_rated"
10.times do |i|
  puts "Importing movies from page #{i + 1}"
  movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)['results']
  movies.each do |movie|
    puts "Creating #{movie['title']}"
    base_poster_url = "https://image.tmdb.org/t/p/original"
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
      rating: movie['vote_average']
    )
  end
end
puts "Movies created"

# Add seed data here. Seed your database with `rake db:seed`

artists_list = [
    "Madison Square Guarden",
    "The big bull outside",
    "Flatiron School",
    "Museum Mile",
    "Subway Station",
    "Cast Iron",
    "Shea Stadium",
    "Flatiron Building",
    "Brooklyn Bridge"
]

artists_list.each do |name|
  a = Artist.new
  a.name = name
  a.save
end

genre_list = [
    "Billy The Kid",
    "Mark Zuckerberg",
    "Ada Lovelace",
    "Linus Torvalds"
]

genre_list.each do |name|
  g = Genre.new
  g.name = name
  g.save
end


song_list = [
    "The Mayor",
    "The Don",
    "Mr. President"
]

song_list.each do |name|
  s = Song.new
  s.name = name
  s.save
end
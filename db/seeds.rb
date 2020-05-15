# Add seed data here. Seed your database with `rake db:seed`
Artist.destroy_all
Song.destroy_all
Genre.destroy_all




a1 = Artist.create(name: "Kanye West")
a2 = Artist.create(name: "Eminem")
a3 = Artist.create(name: "Jay-Z")



g1 = Genre.create(name: "Hip Hop")
g2 = Genre.create(name: "Country")
g3 = Genre.create(name: "Classic Rock")



s1 = Song.create(name: "Runaway", artist_id: a1.id)
s2 = Song.create(name: "Old Town Road", artist_id: a2.id)
s3 = Song.create(name: "Bellybutton", artist_id: a3.id)


SongGenre.create(genre_id: g1.id, song_id: s1.id)
SongGenre.create(genre_id: g2.id, song_id: s2.id)
SongGenre.create(genre_id: g3.id, song_id: s3.id)
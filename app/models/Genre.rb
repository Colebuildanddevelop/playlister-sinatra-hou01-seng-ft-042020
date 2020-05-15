class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug 
    self.name.split(" ").map do |name|
      name.downcase
    end.join("-")
  end

  def self.find_by_slug(slug_name)
    genre_name = slug_name.split("-").map do |name|
      name[0].upcase + name[1..-1]
    end.join(" ")
    Genre.find_by(name: genre_name)
  end
end 
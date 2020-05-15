class Song < ActiveRecord::Base 
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug 
    self.name.split(" ").map do |name|
      name.downcase
    end.join("-")
  end

  def self.find_by_slug(slug_name)
    song_name = slug_name.split("-").map do |name|
      name[0].upcase + name[1..-1]
    end.join(" ")
    Song.find_by(name: song_name)

  end

end
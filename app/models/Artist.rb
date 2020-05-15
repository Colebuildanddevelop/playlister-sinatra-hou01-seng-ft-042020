class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug 
      self.name.split(" ").map do |name|
        name.downcase
      end.join("-")
    end

    def self.find_by_slug(slug_name)
      artist_name = slug_name.split("-").map do |name|
        name[0].upcase + name[1..-1]
      end.join(" ")
      Artist.find_by(name: artist_name)
    end
end
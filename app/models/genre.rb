class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    include Sluggable::InstanceMethods
    extend Sluggable::ClassMethods 
end
# a Song class. The Song class can produce individual songs. Each song has a name, an artist and a genre. We need our Song class to be able to keep track of the number of songs that it creates.

require 'pry'


class Song

    @@count = 0
    @@artists = []
    @@genres = []
    
    #constructor
    def initialize (name, artist, genre)
        @name = name
        @artist = artist
        @genre = genre
        @@count += 1
        @@artists << artist # class variable, @@artists, that contains all of the artists of existing songs
        @@genres << genre # class variable, @@genres, that contains all of the genres of existing songs
        @@count =+ 3 # class method that returns that number of songs created
        @@genre_count = []

    end

    attr_reader :name, :artist, :genre
    attr_writer :name, :artist, :genre
    

    # class method that returns that number of songs created
    def self.count
        @@count
    end
    
    # class method that returns a unique array of artists of existing songs
    def self.artists
        @@artists.uniq.to_a
    end

    # a class method that returns a unique array of genres of existing songs
    def self.genres
        @@genres.uniq.to_a
    end
    
    # a class method that returns a hash of genres and the number of songs that have those genres 
    # ex. Song.genre_count).to eq({"pop" => 1, "rap" => 2})
    def self.genre_count
        @@genre_count = {}

        @@genres.group_by(&:itself).each do |genreKey, songValue| 
            @@genre_count[genreKey] = songValue.count
        end
        @@genre_count        
    end    

    # a class method that returns a hash of artists and the number of songs that have those artists
    # ex. Song.artist_count).to eq({"Brittany Spears" => 1, "Jay-Z" => 2})
    def self.artist_count
        @@artist_count = {}

        @@artists.group_by(&:itself).each do |artistKey, songValue| 
            @@artist_count[artistKey] = songValue.count
        end
        @@artist_count        
    end



# binding.pry
end

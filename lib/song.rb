class Song
  attr_accessor :name, :song, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
  end
  
  def save
    @@all << self
  end

  def self.new_by_filename(song)
    song = filename.split(" - ")
    artist = filename[0]
    artist_song = filename[1]
    artists_song = self.new(song)
    artists_song.new_artist = artist
    artists_song.save
  end
  
  def new_artist(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
  
  def self.all
    @@all
  end
  
end


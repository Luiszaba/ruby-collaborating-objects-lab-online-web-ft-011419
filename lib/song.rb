class Song
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
  end
  
  def save
    @@all << self
  end

  def self.new_by_filename(song)
    artist, song = song.split(" - ")
    artists_song = self.new(song)
    artists_song.new_artist = artist
    artists_song.save
  end
  
  def new_artist=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
  
  def self.find_artist_song(song)
    self.all.select {|songs| songs.artist == artist}
  end
    
  def self.all
    @@all
  end
end


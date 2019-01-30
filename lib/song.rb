class Song
  attr_accessor :name, :song, :artist, :genre, :title
  
  @@all = []
  
  def initialize(name)
    @name = name
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(song)
    song = filename.split(" - ")
    artists_song = self.new(song)
    artists_song.new_artist = artist
    artists_song.save
  end
  
  def new_artist(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
  #def self.new_by_name(name)
end


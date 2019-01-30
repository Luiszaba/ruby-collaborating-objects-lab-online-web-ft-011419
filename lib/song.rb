class Song
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def save
    @@all << self
  end

  def self.new_by_filename(filename)
    song = self.new(filename)
    song.name = filename.split(" - ")[1]
    song.artist = Artist.new(filename.split(" - ")[0])
    song.artist.add_song(song)
    song 
  end 
  
  def new_artist=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
    
  def self.all
    @@all
  end
end


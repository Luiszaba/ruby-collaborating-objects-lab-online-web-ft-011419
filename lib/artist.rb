class Artist
  attr_accessor :name, :artist, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
    
  def add_song(song)
    @songs << song
  end
  
  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name) 
  end
  
  def self.find(name)
    self.all.find {|names| names.name == name}
  end
  
  def self.create(name)
    self.new(name) {|names| names.create}
  end
  
  def print_songs
    @songs.each {|printer| puts printer.name}
  end
end
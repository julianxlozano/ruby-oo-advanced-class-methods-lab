require 'pry'


class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save 
    song 
  end

  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name 
    #song.save 
    song 
  end

  def self.create_by_name(song_name)
    song = self.new 
    song.name = song_name 
    song.save 
    song 
  end

  def self.find_by_name(song_name)
    #binding.pry 
    @@all.find{|song| song.name == song_name}

  end

  def self.find_or_create_by_name(song_name) 
     self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by{|song|song.name}
  end

  def self.new_from_filename(file_name)
    parsed= file_name.strip.split(/[.-]/)
    parsed.pop 
    newer_artist_name=parsed[0].strip
    newer_name= parsed[1].strip
    song=self.new 
    song.artist_name = newer_artist_name
    song.name = newer_name 
    song 
  end

  def self.create_from_filename(file_name)
    parsed= file_name.strip.split(/[.-]/)
    parsed.pop 
    newer_artist_name=parsed[0].strip
    newer_name= parsed[1].strip
    song=self.new 
    song.artist_name = newer_artist_name
    song.name = newer_name 
    song.save
    song 
  end

  def self.destroy_all
    @@all.clear 
  end

end

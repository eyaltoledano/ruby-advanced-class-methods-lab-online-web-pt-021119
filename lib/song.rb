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

  def self.create(name = nil)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.new_by_name(name)
    self.create(name)
  end

  def self.create_by_name(name)
    song = self.create(name)
  end

  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    binding.pry
    list = self.all.collect do |song|
      song.name
    end
    list.sort
  end

end

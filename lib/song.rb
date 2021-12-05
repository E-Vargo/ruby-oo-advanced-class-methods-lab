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
    @@all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    self.all.find {|i| i.name == title}
  end

  def self.find_or_create_by_name(title)
    if find_by_name(title)
      find_by_name(title)
    else
      create_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    song = new_by_name(array[1].chomp(".mp3"))
    song.artist_name = array[0]
    song
  end

def self.create_from_filename(filename)
self.all << new_from_filename(filename)


end

  def self.destroy_all
    self.all.clear
  end

end

class Song  # Song instances have basic properties of a song name and an artist name.

  attr_accessor :name, :artist_name # allows us to write them without having writer method
  @@all = []  # to store all instances for Song that are created through the instance method Song#save
              #when we want to keep track of something tht is based on more than one instances

  def self.all
    @@all     # 
  end

  def save
    self.class.all << self  #pushes info into class method #all
  end

  def self.create   # Song.create - knos it is in the class, so no need to initialize
    song = self.new # instantiates and saves the Song
    song.save # calls #save method
    song
  end

  def self.new_by_name(name)
    song = self.new #instantiate the Song
    song.name = name  #set the name
    song #return
  end

  def self.create_by_name(name)
    song = self.new #instantiate the Song and into new variable song
    song.name = name #set the name
    song.save #save method
    song #returns
  end

  def self.find_by_name(name)
    @@all.find {|tune| tune.name == name} 
    # searches each name in @@all (tune) and see if tune equals name they're needing
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name) 
    # we run #.find_by_name, but if it isn't there, it will run #.create_ny_name
  end

  def self.alphabetical
    #@@all.sort{|first,second| first.name <=> second.name} 
    # takes Song first and second and compares them with <,=,> and sorts ascendingly
    @@all.sort_by {|tune| tune.name}
  end

  def self.new_from_filename(filename) 
    parts = filename.split(" - ") 
      # variable parts = argument is split by the - ("Taylor Swift - Blank Space.mp3")
      # or split_filename = filename.chomp(".mp3").split(" - ")
      # or split_filename = filename.chop.chop.chop.chop.split(" - ")
    artist_name = parts[0]  
    # artist_name method = parts[index 0 = Taylor Swift]
    song_name = parts[1].gsub(".mp3", "") 
    # song_name = parts[index 1 - Blank Space] removes.mp3 with gsub and replaces with nothing
    
 

    song = self.new # new Song is initiated
    song.name = song_name # newSong.#name = Blank Space
    song.artist_name = artist_name # newSong.#artist_name = Taylor Swift
    song #then just the song
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
  
end

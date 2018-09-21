class Room

  attr_reader :capacity
  attr_accessor :capacity, :money, :guests, :songs

  def initialize(capacity, money, guests = [], songs = [])
    @capacity = capacity
    @money = money
    @guests = []
    @songs = []
  end

  def add_guest(guest)
    @guests << guest
  end

  def add_multiple_guests(*guest)
    #create empty array
    guest.each { |g| @guests << g }
    #add each to arry
    #if capacity - guests.length >= empty arry
      #add array to @guests 
  end

  #chuffed I got that bit in
  #shorteened a for loop
  #nice job iain

  def add_song(song)
    @songs << song
  end

  def add_multiple_songs(*song)
    song.each {|s| @songs.push(s)}
  end

  #############i could make these 1 method
  ###when i am comfortable!

  def list_songs()
    @songs.each_with_index do |song, index|
      return "#{index+1}. #{song.name} by #{song.artist}."
    end
  end

  #charge guest amount
  #if guest money > amount
    #remove amount from guest money
    #add amount to room money
  #else return "not enough money"

  def charge_guest(guest, amount)
    if guest.money >= amount
      guest.money -= amount
      @money += amount
    else
      return "#{guest.name} does not have enough money!"
    end
  end

end

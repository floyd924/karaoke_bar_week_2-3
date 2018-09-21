class Room

  attr_reader :capacity
  attr_accessor :capacity, :money, :guests, :songs

  def initialize(capacity, money, guests = [], songs = [])
    @capacity = capacity
    @money = money
    @guests = []
    @songs = []
    @cover = 23
  end

  # def add_guest(guest)
  #   @guests << guest
  # end


  def add_guests(*guest)

    guests_to_add = []

    #if guests money is > cover, proceed
    # for gus in guest
    #   if gus.money >= @cover
    #
    #
    #
        guest.each { |g| guests_to_add << g }
        # guests_to_check_money.each { |g| guests_to_add if g.money >= @cover}
        if @capacity - @guests.count >= guests_to_add.count
          @guests.concat(guests_to_add)
          guest.each { |g| charge_guest(g, @cover)}
        else
          return "Sorry, there is not enough space in the room!"
        end
    #   else
    #     return "Not enough money ya div"
    #   end
    # end
  end



  def add_songs(*song)
    song.each {|s| @songs.push(s)}
  end



  def list_songs()
    @songs.each_with_index do |song, index|
      return "#{index+1}. #{song.name} by #{song.artist}."
    end
  end


  def charge_guest(guest, amount)
    if guest.money >= amount
      guest.money -= amount
      @money += amount
    else
      return "#{guest.name} does not have enough money!"
    end
  end

  #for guest in @guests, return "#{guest.name}, ""
  def list_guests()
    name_array = []
    @guests.each {|g| name_array << g.name}
    return name_array
  end



end

require("minitest/autorun")
require("minitest/rg")
require_relative("../song.rb")
require_relative("../guest.rb")
require_relative("../room.rb")

class TestRoom < MiniTest::Test

  def setup
    @guest5 = Guest.new("Alex", "Naughty Sesh", 40)
    @guest6 = Guest.new("Sean", "Priorities", 60)
    @song5 = Song.new("Online Songs", "Blink-182")
    @song6 = Song.new("Downfall of us all", "A Day To Remember")
    @song7 = Song.new("Naughty Sesh", "Majestic")
    @room5 = Room.new(10, 1000)
  end

  def test_room_has_capacity()
    assert_equal(10, @room5.capacity)
  end

  def test_room_has_money()
    assert_equal(1000, @room5.money)
  end

  def test_add_guest()
    @room5.add_guest(@guest6)
    assert_equal(1, @room5.guests.length)
  end

  def test_add_multiple_guests()
    @room5.add_multiple_guests(@guest5, @guest6)
    assert_equal(2, @room5.guests.length)
  end

  def test_add_song()
    @room5.add_song(@song5)
    assert_equal(1, @room5.songs.count)
  end

  def test_add_multiple_songs()
    @room5.add_multiple_songs(@song5, @song6)
    assert_equal(2, @room5.songs.count)
  end

  #############i could make these 1 method
  ###when i am comfortable!

  def test_list_songs()
    @room5.add_song(@song7)
    assert_equal("1. Naughty Sesh by Majestic.", @room5.list_songs)
  end

  #test charge guest
  def test_charge_guest__success()
    @room5.charge_guest(@guest5, 23)
    assert_equal(17, @guest5.money)
  end

  def test_charge_customer__not_enough_money()
    result = @room5.charge_guest(@guest5, 800)
    assert_equal("Alex does not have enough money!", result)
  end

end

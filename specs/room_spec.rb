require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < MiniTest::Test

  def setup

    @song_1 = Song.new("Back in Black", "AC/DC", "BaaAAaaAAack, BaaAAaaAAack!")
    @song_2 = Song.new("Sympathy for the Devil", "The Rolling Stones", "Pleased to meet you, hope you guessed my name")
    @song_3 = Song.new("Roxanne", "Sting and The Police", "Put on a red light!")
    @guest_1 = Guest.new("Rick", 100, @song_1)
    @guest_2 = Guest.new("Morty", 50, @song_2)
    @guest_3 = Guest.new("Summer", 50, @song_3)
    @songs = [@song_1, @song_2]
    @guests = [@guest_1]
    @room_1 = Room.new("Party Room!",@guests, @songs) 

  end

  def test_room_has_guests
    assert_equal([@guest_1], @room_1.guests())
  end

  def test_room_has_songs
    assert_equal([@song_1, @song_2], @room_1.songs())
  end

  def test_check_in_guests_to_room
    @room_1.check_in(@guest_2)
    assert_equal(2, @room_1.guests().length())
  end

  def test_check_out_guests_to_room
    @room_1.check_out(@guest_1)
    assert_equal([], @room_1.guests())
  end

  def test_add_song_to_room
    @room_1.add_song(@song_3)
    assert_equal(3, @room_1.songs().length())
  end

  def test_remove_song_from_room
    @room_1.remove_song(@song_2)
    assert_equal(1, @room_1.songs().length())
  end


end
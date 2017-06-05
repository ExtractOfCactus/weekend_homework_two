require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < MiniTest::Test

  def setup

    @song_1 = Song.new("Back in Black", "ac/dc", "BaaAAaaAAack, BaaAAaaAAack!")
    @song_2 = Song.new("Sympathy for the Devil", "the rolling stones", "Pleased to meet you, hope you guessed my name")
    @song_3 = Song.new("Roxanne", "sting and the police", "Put on a red light!")
    @guest_1 = Guest.new("Rick", 100, @song_1, 0)
    @guest_2 = Guest.new("Morty", 50, @song_2, 0)
    @guest_3 = Guest.new("Summer", 50, @song_3, 0)
    @guest_4 = Guest.new("Jerry", 15, @song_2, 0)
    @group = Party.new([@guest_1, @guest_2, @guest_3, @guest_4])
    @songs = [@song_1, @song_2]
    @guests = [@guest_1]
    @room_1 = Room.new("Party Room!",@guests, @songs, 10) 

  end

  def test_room_has_guests
    assert_equal([@guest_1], @room_1.guests())
  end

  def test_room_has_songs
    assert_equal([@song_1, @song_2], @room_1.songs())
  end

  def test_find_guest_by_name
    assert_equal(@guest_1, @room_1.find_guest_by_name("Rick"))
  end

  def test_find_song_by_artist
    assert_equal(@song_1, @room_1.find_song_by_artist("ac/dc"))
  end

  def test_check_in_guests_to_room
    @room_1.check_in("Morty", @group)
    @room_1.check_in("Summer", @group)
    @room_1.check_in("Jerry", @group)
    assert_equal(3, @room_1.guests().length())
    assert_equal(40, @guest_2.wallet())
    assert_equal(40, @guest_3.wallet())
    assert_equal(15, @guest_4.wallet())
  end

  def test_check_out_guests_from_room
    @room_1.check_out("Rick")
    assert_equal([], @room_1.guests())
  end

  def test_add_song_to_room
    @room_1.add_song("all")
    assert_equal(3, @room_1.songs().length())
  end

  def test_remove_song_from_room
    @room_1.remove_song(@song_2)
    assert_equal(1, @room_1.songs().length())
  end


end
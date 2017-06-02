require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../song')
require_relative('../bar')

class TestGuest < MiniTest::Test

  def setup

    @bar_1 = Bar.new([{type: "beer", price: 5, stock: 50}, {type: "wine", price: 6, stock: 20}], 50)
    @song_1 = Song.new("Back in Black", "AC/DC", "BaaAAaaAAack, BaaAAaaAAack!")
    @song_2 = Song.new("Sympathy for the Devil", "The Rolling Stones", "Pleased to meet you, hope you guessed my name")
    @song_3 = Song.new("Roxanne", "Sting and The Police", "Put on a red light!")
    @guest_1 = Guest.new("Rick", 100, @song_1)
    @guest_2 = Guest.new("Morty", 50, @song_2)
    @guest_3 = Guest.new("Summer", 50, @song_3)

  end

  def test_guest_has_name
    assert_equal("Rick", @guest_1.name)
  end

  def test_guest_has_wallet
    assert_equal(100, @guest_1.wallet)
  end

  def test_guest_has_favourite_song
    assert_equal(@song_3, @guest_3.fav_song)
  end

  def test_guest_can_sing
    assert_equal("BaaAAaaAAack, BaaAAaaAAack!", @guest_3.sing(@song_1))
  end

  def test_guest_can_sing_favourite_song
    assert_equal("PUT ON A RED LIGHT! AWWWW YEAH!", @guest_3.sing(@song_3))
  end

  # def test_guest_can_buy_beer
  #   result = @guest_1.buy_drink(@bar_1)
  #   assert_equal(55, @bar_1.money())
  #   assert_equal(95, @guest.wallet())
  # end

end
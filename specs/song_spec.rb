require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')

class TestSong < MiniTest::Test

  def setup

    @song_1 = Song.new("Back in Black", "AC/DC", "BaaAAaaAAack, BaaAAaaAAack!")
    @song_2 = Song.new("Sympathy for the Devil", "The Rolling Stones", "Pleased to meet you, hope you guessed my name")
    @song_3 = Song.new("Roxanne", "Sting and The Police", "Put on a red light!")
  end


def test_song_has_name
  assert_equal("Roxanne", @song_3.title())
end

def test_song_has_artist
  assert_equal("The Rolling Stones", @song_2.artist)
end

def test_song_has_lyrics
  assert_equal("BaaAAaaAAack, BaaAAaaAAack!", @song_1.lyrics)
end

end
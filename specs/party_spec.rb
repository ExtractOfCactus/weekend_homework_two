require('minitest/autorun')
require('minitest/rg')
require_relative('../party')
require_relative('../guest')

class TestParty < MiniTest::Test
  def setup

    @guest_1 = Guest.new("Rick", 100, @song_1, 2)
    @guest_2 = Guest.new("Morty", 50, @song_2, 0)
    @guest_3 = Guest.new("Summer", 50, @song_3, 0)
    @guest_4 = Guest.new("Jerry", 15, @song_2, 0)
    @group = Party.new([@guest_1, @guest_2, @guest_3, @guest_4])

  end

  def test_find_guest_by_name
    assert_equal(@guest_1, @group.find_guest_by_name('Rick'))
  end
end
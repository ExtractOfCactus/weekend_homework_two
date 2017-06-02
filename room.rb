require('pry')

class Room
  attr_reader :guests, :songs

  def initialize(room_name, guests, songs)
    @room_name = room_name
    @guests = guests
    @songs = songs
  end

  def check_in(guest)
    @guests << guest
  end

  def check_out(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs << song
  end

  def remove_song(song)
    @songs.delete(song)
  end

end
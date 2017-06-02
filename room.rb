require('pry')

class Room
  attr_reader :guests, :songs, :charge

  def initialize(room_name, guests, songs, charge)
    @room_name = room_name
    @guests = guests
    @songs = songs
    @charge = charge
  end

  def check_in(guest)
    unless @guests.length() >= 2
      if guest.wallet >= @charge
        guest.wallet -= @charge
        @guests << guest
      end
    end
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
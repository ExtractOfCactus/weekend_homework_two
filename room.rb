require('pry')
require_relative('party')



class Room
  attr_reader :guests, :charge
  attr_accessor :songs, :song_book

  def initialize(room_name, guests, songs, charge, song_book)
    @room_name = room_name
    @guests = guests
    @songs = songs
    @charge = charge
    @song_book
  end

  def find_guest_by_name(guest_name)
    @guests.find {|guest| guest.name() == guest_name}
  end

  def find_song_by_title(title)
    @songs.find {|song| song.title() == title}
  end  

  def find_song_by_artist(artist)
    @songs.find {|song| song.artist() == artist}
  end  

  def check_in(guest_name, group)
    guest = group.find_guest_by_name(guest_name)
    unless @guests.length() >= 3 || @guests.include?(guest)
      if guest.wallet >= @charge
        guest.wallet -= @charge
        @guests << guest
        puts "OK, #{guest.name()} has entered The Schwifty Room!"
      end
    else
       puts "Sorry, the room is full. It can only hold three people for some reason."
    end
  end

  def check_out(guest_name)
    if guest_name == "All" || guest_name == "Everyone"
      @guests.clear()
    else
      guest = find_guest_by_name(guest_name)
      @guests.delete(guest)
    end
  end

  def add_song(song_name, all_songs, song_book)
    chosen_song = (song_book.find {|song| song.title() == song_name})
    
    if song_name == "all" || song_name == "all songs"
      song_book.each {|single_song| @songs << single_song}
      puts "All songs added"
    elsif chosen_song == nil
        puts "Sorry, cannot find that song!"
    else
      @songs << chosen_song
      puts "#{song_name} added" 
    end
  end

  def remove_song(song)
    @songs.delete(song)
  end

end
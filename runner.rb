require('pry')
require_relative('room')
require_relative('guest')
require_relative('song')
require_relative('bar')
require_relative('party')

class Runner

  def initialize()

    @song_1 = Song.new("back in black", "ac/dc", "BaaAAaaAAack, BaaAAaaAAack! I'm back in black!")
    @song_2 = Song.new("sympathy for the devil", "the rolling stones", "Pleased to meet you, hope you guessed my name")
    @song_3 = Song.new("roxanne", "sting", "Put on a red light!")
    @guest_1 = Guest.new("Rick", 100, @song_1, 2)
    @guest_2 = Guest.new("Morty", 50, @song_2, 0)
    @guest_3 = Guest.new("Summer", 50, @song_3, 0)
    @guest_4 = Guest.new("Jerry", 10, @song_2, 0)
    @drinks = [{type: "beer", price: 5, stock: 50}, {type: "wine", price: 6, stock: 20}]
    @bar_1 = Bar.new(@drinks, 50)
    @group = Party.new([@guest_1, @guest_2, @guest_3, @guest_4])
    @song_book = [@song_1, @song_2, @song_3]
    @songs = []
    @guests = [@guest_1, @guest_2]
    @room_1 = Room.new("The Schwifty Room",@guests, @songs, 10, @song_book) 

  end

  def cannot_do()
    puts "Nope, can't do that."
  end

  def add_guests()
    puts "Rick and Morty are in 'The Schwifty Room' and there is space for one more. Summer and Jerry enter the building. Who should enter the 'The Schwifty Room'?"
    while true
      guest_name = gets().chomp().capitalize()
      break if guest_name == "No"
      if @group.find_guest_by_name(guest_name) == nil
        puts "There's nobody outside the room with that name."
      else
        @room_1.check_in(guest_name, @group) 
      end
      puts "Do you want to add someone else? If so,who?"
    end 
  end

  def add_songs()
    puts "Cool, now what songs should be available in the room? Back in black, Sympathy for the Devil, Roxanne, or all of them?"
    song_name = gets().chomp().downcase()
    @room_1.add_song(song_name, @all_songs, @song_book)  
  end
    
  def do_stuff()
    while @guests.length() > 0
      puts "Alrighty, what now? Sing, get a drink or leave?"   
      action = gets().chomp().downcase()
      break if action == "quit"
      puts "And who should do it?"
      guest_name = gets().chomp().capitalize()
      guest = @room_1.find_guest_by_name(guest_name)
      if action == "sing"
        puts "What should they sing? AC/DC, The Rolling Stones or Sting?"
        artist = gets().chomp().downcase()
        song = @room_1.find_song_by_artist(artist)
        unless song == nil
          puts "#{guest.sing(song)}"
        else
          cannot_do()
        end
      elsif action == "get a drink" || action == "drink"
        unless guest.wallet() < @bar_1.price_of_drink("beer")
          guest.buy_drink(@bar_1, "beer") 
          puts "#{guest_name} has drank a beer and feels more jolly!"
        else
          puts "Sorry, #{guest_name} does not have enough money for that."
        end
      elsif action == "leave"
        @room_1.check_out(guest_name)
        puts "#{guest_name} has went home."
      else 
        cannot_do()
      end
    end

  end

  def run()
    add_guests()
    add_songs()
    do_stuff()
  end

end

codeclan_caraoke = Runner.new()
codeclan_caraoke.run()
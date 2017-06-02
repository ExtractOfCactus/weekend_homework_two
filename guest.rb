require('pry')
require('pry-byebug')

class Guest
  attr_reader :name, :fav_song, :drunk_level
  attr_accessor :wallet

  def initialize(name, wallet, fav_song, drunk_level)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
    @drunk_level = drunk_level
  end

  def sing_drunk(song)
   
      word_arr = song.lyrics().split (' ')
      word_arr.shuffle!()
      "#{word_arr.join(" ")}....*hic*"
    
  end

  def sing(song)
    if @drunk_level >= 4 
      sing_drunk(song)
    elsif song.title() == fav_song.title()
      "#{song.lyrics().upcase()} AWWWW YEAH!"
    else
      return song.lyrics()
    end
  end

  def drink_drink()
    @drunk_level += 1
  end

  def payment_for_drink(bar, drink)
    beer = bar.drinks.find do |alcohol| 
      alcohol[:type] == drink
    end
    cost = beer[:price]
    bar.money += cost
    @wallet -= cost
  end

  def buy_drink(bar, drink)
    payment_for_drink(bar, drink)
    drink_drink()
    bar.reduce_stock(drink)
  end

  




end
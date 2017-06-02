class Guest
  attr_reader :name, :fav_song
  attr_accessor :wallet

  def initialize(name, wallet, fav_song)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
  end

  def sing(song)
    return "#{song.lyrics().upcase()} AWWWW YEAH!" if song.title() == fav_song.title()
    return song.lyrics()
  end



end
class Guest
  attr_reader :name, :wallet, :fav_song

  def initialize(name, wallet, fav_song)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
  end

  def sing(song)
    if song.title() == fav_song.title()
      return "#{song.lyrics().upcase()} AWWWW YEAH!" 
    else
      return song.lyrics()
    end
  end

end
class Guest
  attr_reader :name, :fav_song
  attr_accessor :wallet

  def initialize(name, wallet, fav_song, drunk_level)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
    @drunk_level = drunk_level
  end

  def sing(song)
    return "#{song.lyrics().upcase()} AWWWW YEAH!" if song.title() == fav_song.title()
    return song.lyrics()
  end

  def sing_drunk(song)
    if @drunk_level >= 4
      word_arr = song.lyrics().split (' ')
      word_arr.shuffle!()
      return"#{word_arr.join(" ")}"
    end
  end




end
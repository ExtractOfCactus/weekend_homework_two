class Song
  attr_reader :title, :artist, :lyrics

  def initialize(title, artist, lyrics)
    @title = title
    @artist = artist
    @lyrics = lyrics
  end
end


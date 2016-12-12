require 'open-uri'

class Song < ActiveRecord::Base
  validates :song_name, presence: true
  validates :artist_name, presence: true
  belongs_to :user

  def in_spotify?
    url = "https://api.spotify.com/v1/search?q=#{song_search}&type=track"
    data = JSON.parse(open(url).read)
    data['tracks']['items'] != []
  end

  def song_search
    artist_name_stripped = artist_name.strip.tr(' ', '+')
    song_name_stripped = song_name.strip.tr(' ', '+')
    song_name_stripped + '+' + artist_name_stripped
  end

  def spotify_uri
    return nil if !in_spotify?
    url = "https://api.spotify.com/v1/search?q=#{song_search}&type=track"
    data = JSON.parse(open(url).read)
    data['tracks']['items'][0]['uri']
  end
end

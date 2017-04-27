class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :song_name, presence: true
  validates :artist_name, presence: true
  validates :spotify_uri, presence: true

  require 'open-uri'

  def find_spotify_uri
    search_query = self.song_search
    url = "https://api.spotify.com/v1/search?q=#{search_query}&type=track"
    search_data = JSON.parse(open(url).read)
    search_data['tracks']['items'][0]['uri']
  end

  def song_search
    self.artist_name.gsub(/\s/, '+') + '+' + self.song_name.gsub(/\s/, '+')
  end

  def in_spotify?
    search_query = self.song_search
    url = "https://api.spotify.com/v1/search?q=#{search_query}&type=track"
    search_data = JSON.parse(open(url).read)
    not (search_data['tracks']['items'] == [])
  end
end

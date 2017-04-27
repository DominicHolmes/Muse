json.extract! post, :id, :title, :body, :song_name, :artist_name, :created_at, :updated_at
json.url post_url(post, format: :json)

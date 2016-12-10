json.extract! user, :id, :name, :followers_id, :playlists_id, :following_id, :created_at, :updated_at
json.url user_url(user, format: :json)
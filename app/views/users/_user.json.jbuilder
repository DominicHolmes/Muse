json.extract! user, :id, :name, :city, :email, :password_hash, :created_at, :updated_at
json.url user_url(user, format: :json)

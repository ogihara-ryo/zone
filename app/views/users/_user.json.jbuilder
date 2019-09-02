json.extract! user, :id, :nickname, :uid, :last_logged_in_at, :created_at, :updated_at
json.url user_url(user, format: :json)

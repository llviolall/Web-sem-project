json.extract! user, :id, :email, :name, :age, :town, :group, :created_at, :updated_at
json.url user_url(user, format: :json)
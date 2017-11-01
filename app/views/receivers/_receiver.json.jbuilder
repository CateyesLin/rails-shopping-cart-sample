json.extract! receiver, :id, :user_id, :name, :phone, :address, :created_at, :updated_at
json.url receiver_url(receiver, format: :json)

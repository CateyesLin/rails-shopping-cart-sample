json.extract! order, :id, :receiver_id, :payment, :status, :created_at, :updated_at
json.url order_url(order, format: :json)

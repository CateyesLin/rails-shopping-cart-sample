json.extract! product, :id, :name, :pricing, :descriptions, :created_at, :updated_at
json.url product_url(product, format: :json)

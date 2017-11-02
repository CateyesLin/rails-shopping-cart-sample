require "rails_helper"

describe API::V1::Products  do
  context 'GET /api/v1/products' do
    it 'Returns all products' do
      get '/api/v1/products'
      expect(response.status).to eq(200)

      content = JSON.parse(response.body)
      expect(content.has_key?('data')).to eq true
      products = content['data']
      expect(products.class.name).to eq 'Array'

      products.each do |product|
        expect(product.has_key?('id')).to eq true
        expect(product['id'] > 0).to eq true

        expect(product.has_key?('name')).to eq true
        expect(product['name'].empty?).to eq false

        expect(product.has_key?('pricing')).to eq true
        expect(product.has_key?('descriptions')).to eq true

        expect(product.has_key?('created_at')).to eq true
        expect(product.has_key?('updated_at')).to eq true
      end
    end
  end
end

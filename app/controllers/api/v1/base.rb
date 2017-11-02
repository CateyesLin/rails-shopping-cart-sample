module API
  module V1
    class Base < Grape::API
      helpers do
        def envelope(data)
          { data: data }
        end
      end

      before do
        header 'Content-Type', 'application/json; charset=utf-8'
      end

      mount API::V1::Users
      mount API::V1::Products
    end
  end
end

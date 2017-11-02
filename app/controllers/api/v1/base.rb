module API
  module V1
    class Base < Grape::API
      helpers do
        def envelope(data)
          { data: data }
        end
      end

      mount API::V1::Users
    end
  end
end

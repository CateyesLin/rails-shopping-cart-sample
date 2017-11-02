module API
  module V1
    class Products < Grape::API
      include API::V1::Defaults

      resource :products do
        # GET /api/v1/products
        # Role: anonymous
        # 商品列表
        desc "Products list"
        params do
        end
        get do
          products = Product.all

          status(200)
          envelope(products)
        end
      end
    end
  end
end

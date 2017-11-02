class CartItem
  attr_reader :product_id, :amount

  def initialize(product_id, amount = 1)
    @product_id = product_id
    @amount = amount
  end

  def increment(n = 1)
    @amount += n
  end

  def product
    Product.find_by(id: product_id)
  end

  def pricing
    product.pricing * amount
  end
end

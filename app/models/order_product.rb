class OrderProduct < ApplicationRecord
  belongs_to :order, :class_name => "Order", :foreign_key => :order_id
  belongs_to :product
end

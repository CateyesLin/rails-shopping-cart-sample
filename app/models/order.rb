class Order < ApplicationRecord
  belongs_to :receiver, :class_name => "Receiver", :foreign_key => :receiver_id
  has_many :order_products

  def status_name
    case self.status
    when 1
      '未付款'
    when 2
      '已付款'
    when 3
      '已出貨'
    when 4
      '已完成'
    when -1
      '已取消'
    else
      '未知狀態'
    end
  end

  def payment_name
    case self.payment
    when 1
      '信用卡'
    when 2
      'ATM 匯款'
    else
      '未知付款方式'
    end
  end

  def can_delivery?
    2 == self.status
  end

  def can_cancel?
    self.status.between?(1, 2)
  end

end

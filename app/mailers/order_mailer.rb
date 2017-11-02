class OrderMailer < ApplicationMailer

  def order_created_mail(order)
    @order = order
    mail(to: @order.receiver.user.email, subject: '您的訂單已成立')
  end
end

class OrderMailer < ActionMailer::Base
  default :from => "byorickq@gmail.com"
  
  def order_complete(order, adress)
    @order = order
    mail(:to => adress, :subject => "Заказ в ласпозе №#{@order.id}")
  end
end

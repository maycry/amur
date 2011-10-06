class OrderMailer < ActionMailer::Base
  default :from => "byorickq@gmail.com"
  
  def order_complete(order)
    @order = order
    mail(:to => "byorickq@gmail.com", :subject => "Заказ в ласпозе №#{@order.id}")
  end
end

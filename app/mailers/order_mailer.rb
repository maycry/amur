class OrderMailer < ActionMailer::Base
  default :from => "shlakomilo@yandex.ru"
  
  def order_complete(order, adress)
    @order = order
    mail(:to => adress, :subject => "Заказ в ласпозе №#{@order.id}")
  end
end

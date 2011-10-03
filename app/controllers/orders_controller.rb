class OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(params[:order])
    redirect_to :action =>'complete' if @order.save! 
  end
  
  def complete
    
  end
end

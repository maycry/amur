class OrdersController < ApplicationController
  def new
    @order = Order.new
    @pages = Page.all
    @type_alias = Type.find_by_alias(params[:type_alias])    
    @types = Type.has_products
    @product = Product.find(params[:product_id])
  end
  
  def create
    @order = Order.new(params[:order])

    redirect_to :action =>'complete' if @order.save! 
  end
  
  def complete
    @pages = Page.all
    @type_alias = Type.find_by_alias(params[:type_alias])    
    @types = Type.has_products
    @product = Product.find(params[:product_id])
  end
end

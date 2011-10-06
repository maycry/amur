class OrdersController < ApplicationController
  def new
    @order = Order.new(:product_id => params[:product_id])
    @pages = Page.all
    @type_alias = Type.find_by_alias(params[:type_alias])    
    @types = Type.has_products
    @product = Product.find(params[:product_id])
  end
  
  def create
    @order = Order.new(params[:order])
    if @order.save
      redirect_to :action =>'complete' 
    else
      render product_order_path(:product_id => @order.product_id)
    end
  end
  
  def complete
    @pages = Page.all
    @type_alias = Type.find_by_alias(params[:type_alias])    
    @types = Type.has_products
  end
end

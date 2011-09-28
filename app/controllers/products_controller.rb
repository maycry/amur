class ProductsController < ApplicationController
  def index
    @products = Product.all
    @pages = Page.all
    @types = Type.all
    @categoties = Category.all
  end
  
  def show
    
  end
end

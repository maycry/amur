class ProductsController < ApplicationController
  def index
    @pages = Page.all
    @types = Type.all
    @categoties = Category.all
    
    if params[:category_alias] == "all"
      @products = Product.find_all_by_type_id(Type.find_by_alias(params[:type_alias]).id)
    elsif params[:category_alias] == "in_stock"
      @products = Product.where("type_id = ? AND in_stock = ?", Type.find_by_alias(params[:type_alias]).id, true)
    else
      @products = Product.where("type_id = ? AND category_id = ?", Type.find_by_alias(params[:type_alias]).id, Category.find_by_alias(params[:category_alias]).id)
    end
  end
  
  def show
    
  end
end

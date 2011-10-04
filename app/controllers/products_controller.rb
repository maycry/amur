class ProductsController < ApplicationController
    
  def home
    redirect_to "/weddingdresses/all"
  end
  
  def index
    @type_alias = Type.find_by_alias(params[:type_alias]).id 
    @pages ||= Page.all
    @types ||= Type.has_products
    @categories ||= current_categories
    
    if params[:category_alias] == "all"
      @products = Product.find_all_by_type_id(@type_alias)
    elsif params[:category_alias] == "in_stock"
      @products = Product.where("type_id = ? AND in_stock = ?", @type_alias, true)
    else
      category_alias = Category.find_by_alias(params[:category_alias]).id
      @products = Product.where("type_id = ? AND category_id = ?", @type_alias, category_alias) 
    end
    add_instock
    
  end
  
  def show
    @product = Product.find_by_articul(params[:articul])
    @pages ||= Page.all
    @types ||= Type.has_products
  end
  
  def destroy_image
    @productimage = Productimage.find(params[:image_id])
    @productimage.destroy
    redirect_to(edit_admin_product_path(params[:id]))
  end
  
  private

  def current_categories
    Category.find_by_sql("SELECT DISTINCT categories.* FROM categories INNER JOIN products ON products.category_id = categories.id WHERE products.type_id = #{@type_alias}") 
  end
  
  def add_instock
    if Product.where("type_id = ?", @type_alias).any?(&:in_stock)
      cat_instock = Category.new
      cat_instock.alias = "in_stock"
      cat_instock.name = "В наличии"
      @categories << cat_instock
    end
  end
  
end

class ProductsController < ApplicationController
  def index
    @type_alias = Type.find_by_alias(params[:type_alias])    
    @pages = Page.all
    @types = current_types
    @categories = current_categories
    
    if params[:category_alias] == "all"
      @products = Product.find_all_by_type_id(@type_alias.id)
    elsif params[:category_alias] == "in_stock"
      @products = Product.where("type_id = ? AND in_stock = ?", @type_alias.id, true)
    else
      category_alias = Category.find_by_alias(params[:category_alias])
      @products = Product.where("type_id = ? AND category_id = ?", @type_alias.id, category_alias.id) 
    end
    add_instock
    
  end
  
  def show
    @product = Product.find_by_articul(params[:articul])
    @pages = Page.all
    @types = current_types
  end
  
  def destroy_image
    @productimage = Productimage.find(params[:image_id])
    @productimage.destroy
    redirect_to(edit_admin_product_path(params[:id]))
  end
  
  private
  
  def current_types
    Type.find_by_sql("SELECT DISTINCT types.* FROM types INNER JOIN products ON products.type_id = types.id")
  end
  def current_categories
    Category.find_by_sql("SELECT DISTINCT categories.* FROM categories INNER JOIN products ON products.category_id = categories.id WHERE products.type_id = #{@type_alias.id}")
  end
  
  def add_instock
    if has_instock?
      cat_instock = Category.new
      cat_instock.alias = "in_stock"
      cat_instock.name = "В наличии"
      @categories << cat_instock
    end
  end
  
  def has_instock?
    instbool = false
    @products.each do |product|
      if product.in_stock 
        instbool = true
        break
      end
    end
    instbool
  end
  
end

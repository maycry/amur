class ProductsController < ApplicationController  

  def home
    #redirect_to "/weddingdresses/all"
    @pages = Page.all
    @types = Type.has_products
    @products = Product.order("created_at desc").page(1);
  end
  
  def index
    @type_alias = Type.find_by_alias(params[:type_alias]).id 
    @pages = Page.all
    @types = Type.has_products
    @categories = Category.current_categories(@type_alias)
    @products = Product.get_products_of_current_type(params[:category_alias], @type_alias, params[:page])
    add_instock
  end
  
  def show
    # @product = Product.find_by_articul(params[:articul])
    @product = Product.where("articul = ? AND category_id = ?", params[:articul], Category.find_by_alias(params[:category_alias]).id).first
    @next_product = Product.next_product(@product.id, Type.find_by_alias(params[:type_alias]).id)
    @previos_product = Product.previos_product(@product.id, Type.find_by_alias(params[:type_alias]).id)
    @pages = Page.all
    @types = Type.has_products

    # find image width and height
    @image_width = @product.productimages.width
    @image_height = @product.productimages.height
  end
  
  def destroy_image
    @productimage = Productimage.find(params[:image_id])
    @productimage.destroy
    redirect_to(edit_admin_product_path(params[:id]))
  end




  private
  
  def add_instock
    if Product.where("type_id = ?", @type_alias).any?(&:in_stock)
      cat_instock = Category.new
      cat_instock.alias = "in_stock"
      cat_instock.name = "В наличии"
      @categories << cat_instock
    end
  end
  
end
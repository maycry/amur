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
      @products = Product.includes(:productimages).order('id DESC').where('type_id =?',@type_alias).page(params[:page])
    elsif params[:category_alias] == "in_stock"
      @products = Product.includes(:productimages).order('id DESC').where("type_id = ? AND in_stock = ?", @type_alias, true).page(params[:page])
    else
      category_alias = Category.find_by_alias(params[:category_alias]).id
      @products = Product.includes(:productimages).order('id DESC').where("type_id = ? AND category_id = ?", @type_alias, category_alias).page(params[:page]) 
    end
    add_instock
  end
  
  def show
    @product = Product.find_by_articul(params[:articul])
    @next_product = Product.order('id DESC').where("id < ? AND type_id = ?", @product.id, Type.find_by_alias(params[:type_alias]).id ).first 
    @previos_product = Product.order('id').where("id > ? AND type_id = ?", @product.id, Type.find_by_alias(params[:type_alias]).id ).first 
    @pages ||= Page.all
    @types ||= Type.has_products
    
    @image_width = JPEG.new(@product.productimages.first.image.url).width
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

class JPEG
  require 'open-uri'
  attr_reader :width, :height, :bits

  def initialize(file)
    if file.kind_of? IO
      examine(file)
    else
      open(file, 'rb') { |io| examine(io) }
    end
  end

private
  def examine(io)
    raise 'malformed JPEG' unless io.getc == 0xFF && io.getc == 0xD8

    class << io
      def readint; (readchar << 8) + readchar; end
      def readframe; read(readint - 2); end
      def readsof; [readint, readchar, readint, readint, readchar]; end
      def next
        c = readchar while c != 0xFF
        c = readchar while c == 0xFF
        c
      end
    end

    while marker = io.next
      case marker
        when 0xC0..0xC3, 0xC5..0xC7, 0xC9..0xCB, 0xCD..0xCF
          length, @bits, @height, @width, components = io.readsof
          raise 'malformed JPEG' unless length == 8 + components * 3
        when 0xD9, 0xDA:  break
        when 0xFE:        @comment = io.readframe
        when 0xE1:        io.readframe
        else              io.readframe
      end
    end
  end
end

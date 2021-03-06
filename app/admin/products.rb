#!/bin/env ruby
# encoding: utf-8
ActiveAdmin.register Product do
  menu :priority => 1
  
  index do
    column :id
    column "Image" do |product|
      image_tag product.productimages.first.image.url(:thumb), :height => "50px" if product.productimages.first !=nil
    end
    column :articul
    column :price
    column :discount
    column :is_active
    column :in_stock
    column :released_at
    column "Type", :sortable => :type_id do |product|
      product.type.name unless product.type.nil?
    end
    column "Brand", :sortable => :category_id do |product|
      product.category.name unless product.category.nil?
    end
    default_actions
  end

  form :partial => "form"
  
  controller do
    def new
      @product = Product.new
      @productimages = 4.times { @product.productimages.build }
      @product.released_at ||= Date.today
      @product.is_active ||= true
      @product.type_id ||= Type.first.id
      @product.category_id ||= Category.first.id
      @product.about ||= "<table cellpadding='0' cellspacing='0' id='table_about'>
      <tbody>
      <tr><td class='table_label'>Материал</td><td><p>атлас, тафта, шифон, органза, шелк,белый, цвет слоновой кости, шампанского</p></td></tr>
      <tr><td class='table_label'>Цвет</td><td ><p>белый, цвет слоновой кости, шампанского</p></td></tr>
      <tr><td class='table_label'>Украшения</td><td><p>swarovski Crystal, стеклярус бисер, блестки, вышивка</p></td></tr></tbody></table>"
    end
    
    def edit
      @product = Product.find(params[:id])
      @productimages = (4-@product.productimages.size).times { @product.productimages.build }
    end
    
    def create
      @product = Product.new(params[:product])
      if @product.save
        redirect_to admin_products_path, :notice => "Product #{@product.articul unless @product.articul.nil?} was created"
      end
    end
      
  end
  
end

#!/bin/env ruby
# encoding: utf-8

class OrdersController < ApplicationController
  def new
    @order = Order.new(:product_id => params[:product_id])
    @order.name ||= session[:name]
    @order.phone ||= session[:phone]
    @order.bust ||= session[:bust]
    @order.waist ||= session[:waist]
    @order.heaps ||= session[:heaps]
    @order.waisttofloor ||= session[:waisttofloor]
    @pages = Page.all
    @type_alias = Type.find_by_alias(params[:type_alias])    
    @types = Type.has_products
    @product = Product.find(params[:product_id])
  end
  
  def create
    @order = Order.new(params[:order])
    if @order.save
      redirect_to "/weddingdresses/all", :notice => "Ваш заказ принят. Мы скоро перезвоним для уточнения деталей."
      OrderMailer.order_complete(@order, "byorickq@gmail.com").deliver
      OrderMailer.order_complete(@order, "bykova.catia@gmail.com").deliver
      session[:name] ||= @order.name
      session[:phone] ||= @order.phone
      session[:bust] ||= @order.bust
      session[:waist] ||= @order.waist
      session[:heaps] ||= @order.heaps
      session[:waisttofloor]||= @order.waisttofloor
    end
  end
  
  def complete
    @pages = Page.all
    @type_alias = Type.find_by_alias(params[:type_alias])    
    @types = Type.has_products
  end
end

class PagesController < ApplicationController
  def show
    @pages = Page.all
    @page = Page.find_by_alias(params[:alias])
    @type_alias = Type.find_by_alias(params[:type_alias])
    @types = Type.has_products
  end


end

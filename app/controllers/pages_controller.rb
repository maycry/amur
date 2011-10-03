class PagesController < ApplicationController
  def show
    @pages = Page.all
    @page = Page.find_by_alias(params[:alias])
    @type_alias = Type.find_by_alias(params[:type_alias])    
    @types = Type.find_by_sql("SELECT DISTINCT types.* FROM types INNER JOIN products ON products.type_id = types.id")
  end

end

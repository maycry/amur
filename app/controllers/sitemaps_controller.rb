class SitemapsController < ApplicationController
  respond_to :xml
  caches_page :show

  def show
    @pages = Page.all
    @types = Type.all
    respond_to do |format|
      format.xml
    end
  end
end
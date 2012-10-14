class ArticleController < ApplicationController
  def index
  	@article = Article.find_by_alias(params[:alias])
  	@articles = Article.all
  	@pages = Page.all
  	@types = Type.has_products
  end

  def redirect
  	@article = Article.first
  	redirect_to article_path(@article.alias)
  end

end

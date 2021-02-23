class ArticlesController < ApplicationController

  def index
    articles = Article.all
    render json: serializer.new(articles), status: :ok
  end

  def serializer
    ArticleSerializer
  end

  def show
    render json: { 'params': params[:id] }
  end

end

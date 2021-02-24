class ArticlesController < ApplicationController

  def index
    articles = Article.where(['title LIKE ?', "%#{params[:id]}%"])
    if articles.empty?
      render json: {
        data: {
          'Error Message': `No data found for param #{params[:id]}`
          }
        }
    else
      render json: serializer.new(articles), status: :ok
    end
  end
 
  def serializer
    ArticleSerializer
  end

  def show
    render json: { 'params': params[:id] }
  end

end

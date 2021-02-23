class ArticlesController < ApplicationController

  def index
    render json: {}, status: :ok
  end

  def show 
    render json: { 'params': params[:id] }
  end

end
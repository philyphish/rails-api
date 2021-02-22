class ArticlesController < ApplicationController

  def index
    render json: { 'page': params[:page] }
  end

  def show 
    render json: { 'params': params[:id] }
  end

end
class Api::V1::ArticlesController < ApplicationController
    # before_action :authenticate_user!, except: [:index, :show]
  def index
    @articles = Article.all
    render json: @articles
end
def show
    @article = Article.find(params[:id])
    render json: @article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end
  
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    head :no_content
  end


  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end

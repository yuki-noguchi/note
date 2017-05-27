class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.includes(:user).order('created_at DESC')
  end

  def show
    @user = @article.user
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.user_id == current_user.id
      @article.update(article_params)
      redirect_to article_path
    else
      render :edit
    end
  end

  def destroy
    if @article.user_id == current_user.id
      @article.destroy
      redirect_to root_path
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :image).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end

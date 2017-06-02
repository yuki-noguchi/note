class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy, :purchase]

  def index
    @articles = Article.includes(:author).order('created_at DESC')
  end

  def show
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
    if @article.author_id == current_user.id
      @article.update(article_params)
      redirect_to article_path
    else
      render :edit
    end
  end

  def destroy
    if @article.author_id == current_user.id
      @article.destroy
      redirect_to root_path
    end
  end

  def purchase
    Purchase.create(buyer_id: current_user.id, paid_article_id: @article.id)
    Payjp.api_key = Rails.application.secrets.payjp_secret_key
    charge = Payjp::Charge.create(
    amount: @article.price,
    card: params['payjp-token'],
    currency: 'jpy',
  )
    redirect_to article_path(@article)
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :image, :price, :limit).merge(author_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end

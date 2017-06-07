class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.order('created_at DESC')
  end

  def search
    @users = User.where('nickname LIKE(?)', "%#{params[:keyword]}%").or(User.where('email LIKE(?)', "%#{params[:keyword]}%")).where.not(email: current_user.email).order('nickname ASC')
    render json: @users
  end
end

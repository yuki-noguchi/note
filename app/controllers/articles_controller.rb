class ArticlesController < ApplicationController

  before_action :user_nickname
  def index
  end

  def show
  end

  def user_nickname
    if user_signed_in?
      if current_user.nickname?
        @nickname = current_user.nickname
      else
        @nickname = current_user.email.sub(/@.+/, "")
      end
    end
  end
end

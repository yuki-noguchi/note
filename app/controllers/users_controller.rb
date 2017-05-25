class UsersController < ApplicationController
  def show
    if user_signed_in?
      if current_user.nickname?
        @nickname = current_user.nickname
      else
        @nickname = current_user.email.sub(/@.+/, "")
      end
    end
  end
end

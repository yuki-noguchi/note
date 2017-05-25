class Article < ApplicationRecord
    if current_user.nickname?
      @nickname = current_user.nickname
    else
      @nickname = current_user.email.sub(/@.+/, "")
    end
end

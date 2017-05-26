module ApplicationHelper
  def user_nickname(instanse)
    if instanse == @user
      user = @user
    else
      user = instanse.user
    end
    if user.nickname?
      return user.nickname
    else
      return user.email.sub(/@.+/, "")
    end
  end

  def article_image(article)
    content_tag :a, href: article_path(article) do
      concat (content_tag :img, "", src: article.image) if article.image
    end
  end

  def user_avatar(instanse)
    if instanse == current_user
      user = current_user
    elsif instanse == @user
      user = @user
    else
      user = instanse.user
    end
    if user.avatar?
      content_tag :img, "", src: user.avatar
    else
      content_tag :img, "", src: '/assets/prof.jpg'
    end
  end
end

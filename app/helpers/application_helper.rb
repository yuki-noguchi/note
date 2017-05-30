module ApplicationHelper
  def user_nickname(user)
    if user.nickname?
      return user.nickname
    else
      return user.email.sub(/@.+/, "")
    end
  end

  def article_image(article)
    content_tag :a, href: article_path(article) do
      concat (content_tag :img, "", src: article.image) if article.image.url
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
      return image_tag asset_path 'prof.jpg'
    end
  end

  def user_profile(user)
    return simple_format(user.profile) if user.profile?
  end
end

module UsersHelper
  def head_image(user)
    content_tag :img, "", src: user.head_image if user.head_image.url
  end
end

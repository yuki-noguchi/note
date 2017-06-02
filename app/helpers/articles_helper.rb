module ArticlesHelper
  def delete(article)
    if user_signed_in? && article.author_id == current_user.id
      link_to '削除する', article_path, method: :delete, data: { confirm: '本当に削除してもよろしいですか？' }
    end
  end

  def edit(user)
    if user_signed_in? && user.id == current_user.id
      content_tag :div, class: 'note__user__edit' do
        concat (content_tag :a, '編集', href: edit_article_path)
      end
    end
  end

  def article_has_price?(article)
    if article.price
      simple_format(truncate(article.body, length: article.limit))
    else
      simple_format(truncate(article.body, length: 192))
    end
  end

  def display_more?(article)
    link_to 'もっとみる', article_path(article) if article.body.length >= 192 || article.price
  end

  def price(article)
    if article.price
      content_tag :div, class: 'content__article__price' do
        concat(content_tag :span, "#{article.price}円")
      end
    end
  end

  def paid?(article)
    if article.price?
      if user_signed_in?
        if current_user.purchases.where(paid_article_id: article.id).present? || article.author_id == current_user.id
          simple_format(article.body.gsub(/\n/, '<br>'))
        else
          render 'shared/pay-wall', article: article
        end
      else
        render 'shared/pay-wall', article: article
      end
    else
      simple_format(article.body.gsub(/\n/, '<br>'))
    end
  end

  def image_on_paywall?(article)
    if article.image.url
      image_tag article.image
    else
      image_tag asset_path 'pen.jpg'
    end
  end

  def can_purchase?
    if user_signed_in?
      form_tag purchase_article_path, method: :post do
        javascript_include_tag "https://checkout.pay.jp", class: 'payjp-button', data: {key: "#{Rails.application.secrets.payjp_public_key}", text: "購入して続きをみる", submit: {text: '購入する'}}
      end
    else
      content_tag(:div, class: 'not-login') do
        link_to '購入して続きを見る', new_user_session_path, method: :post
      end
    end
  end

end

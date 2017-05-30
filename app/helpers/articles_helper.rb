module ArticlesHelper
  def delete(article)
    if article.author_id == current_user.id
      link_to '削除する', article_path, method: :delete, data: { confirm: '本当に削除してもよろしいですか？' }
    end
  end

  def edit(user)
    if user.id == current_user.id
      content_tag :div, class: 'note__user__edit' do
        concat (content_tag :a, '編集', href: edit_article_path)
      end
    end
  end

  def display_more?(article)
    link_to 'もっとみる', article_path(article) if article.body.length >= 192
  end
end

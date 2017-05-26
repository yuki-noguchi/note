module ArticlesHelper
  def delete(user, article)
    if user.id == current_user.id
      link_to '削除する', article, method: :delete, data: { confirm: '本当に削除してもよろしいですか？' }
    end
  end

  def edit(user)
    if user.id == current_user.id
      content_tag :div, class: 'note__user__edit' do
        concat (content_tag :a, '編集', href: edit_article_path)
      end
    end
  end
end

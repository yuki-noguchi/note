module ArticlesHelper
  def delete(user, article)
    if user.id == current_user.id
      link_to '削除する', article, method: :delete, data: { confirm: '本当に削除してもよろしいですか？' }
    end
  end
end

class RenameArticleIdColumnToPaidArticleId < ActiveRecord::Migration[5.0]
  def change
    rename_column :purchases, :article_id, :paid_article_id
  end
end

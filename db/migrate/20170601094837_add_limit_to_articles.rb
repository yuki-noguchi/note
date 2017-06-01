class AddLimitToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :limit, :integer
  end
end

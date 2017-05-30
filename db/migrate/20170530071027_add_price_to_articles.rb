class AddPriceToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :price, :integer
  end
end

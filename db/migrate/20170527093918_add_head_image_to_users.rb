class AddHeadImageToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :head_image, :string
  end
end

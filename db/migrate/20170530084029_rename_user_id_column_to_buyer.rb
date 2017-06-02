class RenameUserIdColumnToBuyer < ActiveRecord::Migration[5.0]
  def change
    rename_column :purchases, :user_id, :buyer_id
  end
end

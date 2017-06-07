class RenameUserIdToTalkerIdOnMessages < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :user_id, :talker_id
  end
end

class RenameUserIdToTalkerId < ActiveRecord::Migration[5.0]
  def change
    rename_column :group_talkers, :user_id, :talker_id
  end
end

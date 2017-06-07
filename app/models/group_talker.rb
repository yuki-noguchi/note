class GroupTalker < ApplicationRecord
  belongs_to :group
  belongs_to :talker, class_name: :User
end

class Message < ApplicationRecord
  belongs_to :talker, class_name: 'User'
  belongs_to :group
  validates_presence_of :body
end

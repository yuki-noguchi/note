class Group < ApplicationRecord
  has_many :group_talkers, dependent: :delete_all
  has_many :talkers, through: :group_talkers, class_name: 'User'
  has_many :messages, dependent: :delete_all
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles, foreign_key: :author_id, dependent: :delete_all
  has_many :purchases, foreign_key: :buyer_id
  has_many :paid_articles, through: :purchases, source: :article

  has_many :messages, foreign_key: :talker_id, dependent: :delete_all
  has_many :group_talkers, foreign_key: :talker_id
  has_many :groups, through: :group_talkers
  accepts_nested_attributes_for :group_talkers
  mount_uploader :avatar, ImageUploader
  mount_uploader :head_image, ImageUploader
end

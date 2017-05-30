class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles, foreign_key: :author_id
  has_many :paid_articles, through: :purchases, source: :articles, foreign_key: :buyer_id
  mount_uploader :avatar, ImageUploader
  mount_uploader :head_image, ImageUploader
end

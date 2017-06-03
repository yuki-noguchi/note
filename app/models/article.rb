class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :purchases, foreign_key: :paid_article_id, dependent: :delete_all
  has_many :buyers, through: :purchases, source: :user
  validates_presence_of [:title, :body]
  mount_uploader :image, ImageUploader
end

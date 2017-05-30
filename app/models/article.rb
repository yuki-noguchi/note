class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :buyer, through: :purchases, source: :User
  validates_presence_of [:title, :body]
  mount_uploader :image, ImageUploader
end

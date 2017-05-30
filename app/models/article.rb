class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates_presence_of [:title, :body]
  mount_uploader :image, ImageUploader
end

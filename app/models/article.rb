class Article < ApplicationRecord
  belongs_to :user
  validates_presence_of [:title, :body]
  mount_uploader :image, ImageUploader
end

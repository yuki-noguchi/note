class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  mount_uploader :image, ImageUploader
  mount_uploader :avatar, ImageUploader
  mount_uploader :head_image, ImageUploader
end

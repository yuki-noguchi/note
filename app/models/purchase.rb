class Purchase < ApplicationRecord
  belongs_to :buyer, class_name: :User
  belongs_to :paid_article
end

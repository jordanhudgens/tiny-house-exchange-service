class Home < ApplicationRecord
  has_one_attached :featured_image
  has_many_attached :images
  belongs_to :user
end

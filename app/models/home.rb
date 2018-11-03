class Home < ApplicationRecord
  has_one_attached :featured_image
  has_many_attached :images
  belongs_to :user

  def featured_image_url
    if self.featured_image.attachment
      self.featured_image.attachment.service_url
    end
  end
end

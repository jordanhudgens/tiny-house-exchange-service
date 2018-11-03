class HomeSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :description,
             :featured_image_url

  has_one :user
end

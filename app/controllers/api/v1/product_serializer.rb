class Api::V1::ProductSerializer < ActiveModel::Serializer
  attributes :id , :name , :description , :image
  has_one :category
  has_one :user
end

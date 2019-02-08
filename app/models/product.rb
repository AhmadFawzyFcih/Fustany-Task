class Product < ApplicationRecord
    belongs_to :user
    belongs_to :category

    scope :orderByCreatedAt, lambda { order(:created_at => :desc) }
 
    mount_uploader :image , ImageUploader
    validates :name, presence: true, length: {maximum: 50}
end

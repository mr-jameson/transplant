class Plant < ApplicationRecord
  belongs_to :user
  has_one :address, through: :user
  enum light: { low: 0, moderate: 1, bright: 2 }
  enum size: { small: 0, medium: 1, large: 2 }
  validates :name, :price, :species, :light, :size, :description, :image, presence: true
  has_one_attached :image
end

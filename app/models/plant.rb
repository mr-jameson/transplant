class Plant < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  enum light: {low: 0, moderate: 1, bright:2}
  enum size: {small:0, medium:1, large:2}
end

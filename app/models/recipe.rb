class Recipe < ApplicationRecord
  validates :name, presence: true, length: { maximun: 30 }
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods
end

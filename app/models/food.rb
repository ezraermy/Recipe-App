class Food < ApplicationRecord
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
  validates :measurement_unit, presence: true
  validates :measurement_unit, inclusion: { in: %w[g kg ml l oz lb] }
  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true
end

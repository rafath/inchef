class Meal < ApplicationRecord

  belongs_to :restaurant

  has_many :products, through: :ingredients

  has_many :ingredients
  accepts_nested_attributes_for :ingredients


end

class Meal < ApplicationRecord

  belongs_to :restaurant
  has_and_belongs_to_many :products
  has_many :ingredients

end

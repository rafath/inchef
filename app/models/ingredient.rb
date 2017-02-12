class Ingredient < ApplicationRecord

  belongs_to :restaurant

  belongs_to :product
  belongs_to :meal

end

class MealOption < ApplicationRecord

  belongs_to :restaurant

  belongs_to :meal
  belongs_to :category, optional: true

end

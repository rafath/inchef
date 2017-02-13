class Restaurant < ApplicationRecord

  belongs_to :user

  has_many :meals
  has_many :categories
  has_many :meal_options
  has_many :products
  has_many :ingredients

  validates_presence_of :name
end

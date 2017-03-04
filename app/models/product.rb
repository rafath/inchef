class Product < ApplicationRecord

  belongs_to :restaurant
  belongs_to :invoices, optional: true
  has_many :meals, through: :ingredients

end

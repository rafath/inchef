class Ingredient < ApplicationRecord

  attr_accessor :product_name

  belongs_to :restaurant

  belongs_to :product
  belongs_to :meal

  before_save :update_products

  def update_products
    return unless product_name.present?
    self.product = Product.find_or_create_by(name: product_name)
    meal.products << self.product unless meal.products.include?(self.product)
    meal.save
  end

end

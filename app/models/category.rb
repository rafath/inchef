class Category < ApplicationRecord

  before_save :set_slug

  belongs_to :restaurant

  has_many :meals
  has_many :meal_options

  validates_presence_of :name

  def set_slug
    self.slug = self.name.to_url_format if self.name.present?
  end



end

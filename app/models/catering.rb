class Catering < ApplicationRecord

  belongs_to :user, inverse_of: :caterings
  belongs_to :restaurant

  has_many :deliveries

end

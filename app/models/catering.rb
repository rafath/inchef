class Catering < ApplicationRecord

  belongs_to :user

  has_many :deliveries

end

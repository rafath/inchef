class Delivery < ApplicationRecord

  belongs_to :user
  belongs_to :catering

end

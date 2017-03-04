class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :restaurants
  has_many :caterings
  has_many :catering_exceptions
  has_many :deliveries

  def restaurant(id)
    self.restaurants(id).first
  end
end

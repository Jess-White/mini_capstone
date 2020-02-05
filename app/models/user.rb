class User < ApplicationRecord
  has_secure_password

  has_many :orders
  has_many :carted_products

  validates :email, presence: true, uniqueness: true

  def cart
    carted_products.where(status: "carted")
  end 
end

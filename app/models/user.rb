class User < ApplicationRecord
  has_secure_password

  has_many :orders
  
  validates :email, presence: true, uniqueness: true
end

class User < ApplicationRecord
	has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :orders #returns an array of orders
  has_many :carted_products
end

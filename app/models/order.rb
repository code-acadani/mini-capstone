class Order < ApplicationRecord
	belongs_to :user #returns a user hash
	has_many :carted_products
	has_many :products, through: :carted_products
end

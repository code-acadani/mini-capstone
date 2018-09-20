class CartedProduct < ApplicationRecord
	belongs_to :product #returns a product hash
	belongs_to :user
	belongs_to :order, optional: true
end

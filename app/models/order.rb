class Order < ApplicationRecord
	belongs_to :user #returns a user hash
	belongs_to :product #returns a product hash
end

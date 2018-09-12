class Supplier < ApplicationRecord

	# def products
	# 	Product.where(supplier_id: id) #returns an array of products
	# end

	has_many :products

end

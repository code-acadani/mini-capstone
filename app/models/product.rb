class Product < ApplicationRecord

	# def supplier
	# 	Supplier.find_by(id: supplier_id) #returns a supplier hash
	# end

	has_many :carted_products
	has_many :orders, through: :carted_products
	has_many :category_products
	has_many :categories, through: :category_products
	belongs_to :supplier
	has_many :images

	def category_names
		categories.map { |category| category.name }
	end

	validates :name, presence: true
	validates :name, uniqueness: true
	validates :name, length: { maximum: 40 }
	validates :price, numericality: { greater_than: 0 }
	validates :description, length: { in: 6..10000 }

	def is_discounted?
		price <= 10
	end

	def tax
		price * 0.09
	end

	def total
		price + tax
	end

end

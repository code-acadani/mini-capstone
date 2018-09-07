class Api::ProductsController < ApplicationController
	def index
	  @products = Product.all

	  if params[:name]
	  	@products = Product.where("name LIKE ?", "%#{params[:name]}%")
	  end

	  if params[:price_sort]
	  	@products = @products.order(price: :asc)
	  else 
	  	@products = @products.order(id: :asc)
	  end

	  render 'index.json.jbuilder'
	end

	def create
	  @product = Product.new(
	   name: params[:name],
	   price: params[:price],
	   description: params[:description],
	   image_url: params[:image_url]
	  )
	  if @product.save #happy path
	  	render 'show.json.jbuilder'
	  else #sad path
	  	render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
	  end
	end

	def show
	  @product = Product.find(params[:id])
	  render 'show.json.jbuilder'
	end

	def update
	  @product = Product.find(params[:id])
	  
	  @product.name = params[:name] || @product.name
	  @product.price = params[:price] || @product.price
	  @product.description = params[:description] || @product.description
	  @product.image_url = params[:image_url] || @product.image_url

	  if @product.save #happy path
	  	render 'show.json.jbuilder'
	  else #sad path
	  	render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
	  end
	end

	def destroy
	  @product = Product.find(params[:id])
	  @product.destroy
	  render json: {message: "Product successfully destroyed"}
	end
end

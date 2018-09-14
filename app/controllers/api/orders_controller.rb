class Api::OrdersController < ApplicationController

	def index
		@orders = current_user.orders
		render 'index.json.jbuilder'
	end

	def create
		@order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity]
    )

    calc_subtotal = @order.product.price * @order.quantity
    calc_tax = calc_subtotal * 0.09
    calc_total = calc_subtotal + calc_tax

    @order.subtotal = calc_subtotal
    @order.tax = calc_tax
    @order.total = calc_total

    if @order.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @order.errors.full_messages}, status: :bad_request
    end
	end
end

class Api::OrdersController < ApplicationController
  # before_action :authenticate_user, only: [:index, :create]
  # before_action :authenticate_user, except: [:index, :create]
  
  def index
    # authenticate_user

    if current_user
      @orders = current_user.orders
      render "index.json.jb"
    else 
      render json: [], status: :unauthorized]
    end 
  end 


def create
   @order = Order.new(
                        user_id: current_user.id,
                        product_id: params[:product_id],
                        quantity: params[:quantity],
                        )
    @order.calculate_totals
    
    if @order.save
      render 'show.json.jb'
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
    end  
  end 


# 8) Change the orders create action to do the following:
#       i) Find all of the current user’s carted products that have a status of “carted”.
#       ii) Use that data to create a new row in the orders table, and save the user_id, subtotal, tax, and total.
#       iii) Modify all the rows from the carted_products table so that their status changes to “purchased” and that they are given the appropriate order_id.

  # def create
  #   #look below for a refactored alternative
  #   product = Product.find(params[:product_id])
  #   calculated_subtotal = product.price * params[:quantity].to_i
  #   calculated_tax = calculated_subtotal * 0.09
  #   calculated_total = calculated_subtotal + calculated_tax

  #   @order = Order.new(
  #                       user_id: current_user.id,
  #                       product_id: params[:product_id],
  #                       quantity: params[:quantity],
  #                       subtotal: calculated_subtotal,
  #                       tax: calculated_tax,
  #                       total: calculated_total
  #                       )
  #   if @order.save
  #     render 'show.json.jb'
  #   else
  #     render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
  #   end  
  # end 

  def show
    @order = Order.find(params[:id])
    render 'show.json.jb'
  end  
end

# alternative:

# def create
#         @order = Order.new(
#                         user_id: current_user.id,
#                         product_id: params[:product_id],
#                         quantity: params[:quantity],
#                         )
#     @order.calculate_totals
#     
#     if @order.save
#       render 'show.json.jb'
#     else
#       render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
#     end  
#   end 

class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    #basic: 
    #@carted_products = CartedProduct.all
    #render 'index.json.jb'
    # if current_user
    #   @carted_products = current_user.carted_products.where(status: "carted")
    @carted_products = current_user.cart
    render "index.json.jb"
  end 

    # 6) Make a CartedProducts index action. Note that this shouldn’t show ALL the carted products - it should only display the current user’s carted products that have a status of “carted”!

  def create 
    @carted_product = CartedProduct.new(
                                        quantity: params[:quantity],
                                        product_id: params[:product_id],
                                        user_id: current_user.id,
                                        status: "carted"
                                        )
    @carted_product.save 
      render 'show.json.jb'
  end 

  def destroy
    carted_product = CartedProduct.find(params[:id])
    carted_product.update(status: "removed")
    render json: {message: "This item is removed from your cart"}
  end 
end


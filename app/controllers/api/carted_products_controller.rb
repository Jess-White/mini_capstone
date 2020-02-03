class Api::CartedProductsController < ApplicationController

  def index
    if current_user
      @carted_products = current_user.carted_products.where(status: "carted")
      render "index.json.jb"
    end 
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
end


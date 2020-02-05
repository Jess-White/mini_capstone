class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:index, :create]
  
  def index

    if current_user
      @orders = current_user.orders
      render "index.json.jb"
    else 
      render json: [], status: :unauthorized]
    end 
  end 

def create
  @order = Order.new(user_id: current_user.id)
  @order.calculate_totals
    render "show.json.jb"
  @order.save
end 

  def show
    @order = Order.find(params[:id])
    render 'show.json.jb'
  end  
end


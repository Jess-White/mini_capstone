class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]

  def index 
    @products = Product.all

    search_term = params[:search]
    discount_option = params[:discount]
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    category_choice = params[:category]

    if category_choice
      category = Category.find_by(name: category_choice)
      @products = category.products
    end 

    if search_term
      @products = Product.where("name iLIKE ?", "%#{ search_term }%")
    end 

    if discount_option == "true"
      @products = @products.where("price < ?", 50)
    # elsif discount_option =~ /\A\d+([.]|)\d{0,2}\z/
    #   @products = @products.where("price < ?", discount_option)
    end 

    if sort_attribute == "price" && sort_order
      @products = @products.order(sort_attribute => sort_order)
    elsif sort_attribute 
      @products = @products.order(sort_attribute)
    else 
      @products = @products.order(:id)
    end 

    #IN ACTIVE RECORD QUERIES, you can pass in strings as well as symbols - you could for example say (price: "desc") and it would work

    render 'index.json.jb'


  end 

  def create
    @product = Product.new( 
                            name: params[:name],
                            price: params[:price],
                            description: params[:description],
                            in_stock: params[:instock]
                            )
    if @product.save 
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end 
  end 

  def show 
      @product = Product.find(params[:id])
      render 'show.json.jb'
  end  

  def update 
    @product = Product.find(params[:id])

    @product.name =         params[:name] || @product.name
    @product.price =        params[:price] || @product.price
    @product.description =  params[:description] || @product.description
    @product.in_stock = params[:in_stock] || @product.in_stock

    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end 
  end 

  def destroy
    product = Product.find(params[:id])
    product.destroy
    product.save
    render json: {message: "Product #{product.name} successfully destroyed."}
  end 
end

class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def calculate_subtotal
    self.subtotal = carted_products.sum { |carted_product| carted_product.subtotal} 
  end 

  def calculate_tax
    self.tax = subtotal * 0.09
  end 

  def calculate_total
    self.total = subtotal + tax
  end 

  def calculate_totals
    save
    user.cart.update (status: "purchased", order_id: id)
    calculate_subtotal
    calculate_tax
    calculate_total
  end 
end 

  # def calculate_totals(user)
  #   carted_products = user.cart
  #   subtotal_sum = 0

  #   carted_products.each do |carted_products|
  #     subtotal_sum += carted_products.subtotal
  #   end 

    

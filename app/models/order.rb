class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user


  def calculate_subtotal
    self.product.price * self.quantity
  end 

  def tcalculate_tax
    subtotal * 0.09
  end 

  def calculate_total
    subtotal + tax
  end 

  def calculate_totals
    calculate_subtotal
    calculate_tax
    calculate_total
  end 
# def subtotal
#   product.price * quantity
# end

# def tax
#   product.price * 0.09
# end 

# def total
#   tax + subtotal
# end
end 
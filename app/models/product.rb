class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images

  # def supplier
  #   Supplier.find_by(id: self.supplier_id)
  #   #returns a supplier object - the one associated with this product.
  # end 


  validates :name, presence: true
  validates :price, presence: true
  validates :name, length: { maximum: 255 }
  validates :description, length: {minimum: 10}
  validates :description, length: {maximum: 500}
  validates :price, numericality: true
  validates :price, numericality: {greater_than: 0}
  validates :price, numericality: {less_than: 100000}
  # validates :price, :format => { :with => /^\d{1,6}(\.\d{0,2})?$/ }


# class Person < ApplicationRecord
#   validates :name, length: { minimum: 2 }
#   validates :bio, length: { maximum: 500 }
#   validates :password, length: { in: 6..20 }
#   validates :registration_number, length: { is: 6 }
# end

  def is_discounted?
    self.price < 3 ? true : false
  end

  def tax
    price * 0.09
    # longer: return self.price * 0.09
  end

  def total
    price + tax
    # longer: return self.price + self.tax
  end 
end


class ProductCategory < ApplicationRecord
  #holds the foreign keys
  belongs_to :product 
  belongs_to :category 


end

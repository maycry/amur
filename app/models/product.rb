class Product < ActiveRecord::Base
  belongs_to :type
  belongs_to :category
  has_many :productimages, :dependent => :destroy
  has_one :order
  
  accepts_nested_attributes_for :productimages, :allow_destroy => true
  
 
end

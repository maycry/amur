class Product < ActiveRecord::Base
  paginates_per 15
  
  belongs_to :type
  belongs_to :category
  has_many :productimages, :dependent => :destroy
  has_many :orders
  
  accepts_nested_attributes_for :productimages, :allow_destroy => true
  
end

class Product < ActiveRecord::Base
  paginates_per 15
  
  belongs_to :type
  belongs_to :category
  has_many :productimages, :dependent => :destroy
  has_one :order
  
  accepts_nested_attributes_for :productimages, :allow_destroy => true
  
  attr_accessible :about
end

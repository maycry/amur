class Order < ActiveRecord::Base
  belongs_to :product
  attr_accessible :name, :phone, :bust, :waist, :heaps, :waisttofloor, :product_id
  
  validates :name, 
            :presence => true,
            :length => { :maximum => 50 }
            
  validates :phone, 
            :presence => true

end

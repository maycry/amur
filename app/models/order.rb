class Order < ActiveRecord::Base
  belongs_to :product
  attr_accessible :name, :phone, :bust, :waist, :heaps, :waisttofloor
  
  validates :name, 
            :presence => true, 
            :length => { :maximum => 50 }, 
            :format => { :with => /\A[a-zA-Zа-яА-Я]+\z/, :message => "Only letters allowed" }

end

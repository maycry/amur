class Order < ActiveRecord::Base
  belongs_to :product
  attr_accessible :name, :phone, :bust, :waist, :heaps, :waisttofloor
end

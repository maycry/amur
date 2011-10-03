class Type < ActiveRecord::Base
  has_many :products
  
  scope :has_products, find_by_sql("SELECT DISTINCT types.* FROM types INNER JOIN products ON products.type_id = types.id")
end

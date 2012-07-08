class Category < ActiveRecord::Base
  has_many :products

  def self.current_categories(type)
  	find_by_sql("SELECT DISTINCT categories.* FROM categories INNER JOIN products ON products.category_id = categories.id WHERE products.type_id = #{type}")
  end
end

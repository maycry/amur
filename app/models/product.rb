class Product < ActiveRecord::Base
  paginates_per 15
  
  belongs_to :type
  belongs_to :category
  has_many :productimages, :dependent => :destroy
  has_many :orders
  accepts_nested_attributes_for :productimages, :allow_destroy => true

  scope :next_product, 

  def self.get_products_of_current_type(category, type, page)
  	products = includes(:productimages).order('id DESC')
  	if category == "all"
      products.where('type_id =?',type).page(page)
    elsif category == "in_stock"
      products.where("type_id = ? AND in_stock = ?", type, true).page(page)
    else
      category_alias = Category.find_by_alias(category).id
      products.where("type_id = ? AND category_id = ?", type, category_alias).page(page) 
    end
  end

  def self.next_product(id, type)
  	order('id DESC').where("id < ? AND type_id = ?", id, type).first 
  end

  def self.previos_product(id, type)
  	order('id').where("id > ? AND type_id = ?", id, type).first 
  end
end

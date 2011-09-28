class Productimage < ActiveRecord::Base
  belongs_to :product
  
  has_attached_file :image, 
    :styles => {:thumb => "180x300>"},
    :url  => "products/:product_id/:style/:basename.:extension",
    :path => "products/:product_id/:style/:basename.:extension",
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS
    
end

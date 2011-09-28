class Productimage < ActiveRecord::Base
  belongs_to :product
  
  has_attached_file :image, 
    :styles => {:thumb => "180x300>"},
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS
end

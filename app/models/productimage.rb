class Productimage < ActiveRecord::Base
  belongs_to :product
  
  has_attached_file :image, 
    :styles => {:thumb => "180x284#", :thumb_bigger => "231x364#", :thumb_bigest => "312x491#"},
    :url  => "products/:product_id/:style/:basename.:extension",
    :path => "products/:product_id/:style/:basename.:extension",
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS

  def self.width
    open(self.first.image.url, "rb") do |fh|
    	ImageSize.new(fh.read).w
    end
  end
  
  def self.height
    open(self.first.image.url, "rb") do |fh|
      ImageSize.new(fh.read).h
    end
  end
    
end

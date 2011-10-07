class Page < ActiveRecord::Base
  has_attached_file :illustration, 
    :url  => "pages/:basename.:extension",
    :path => "pages/:basename.:extension",
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS
end

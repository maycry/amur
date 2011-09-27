class Productimage < ActiveRecord::Base
  belongs_to :product
  
   has_attached_file :image, :style => {:thumb => '180x300>'}
    :storage => :s3,
    :bucket => 'pics.lasposadress.com.ua',
    :s3_credentials => {
      :access_key_id => ENV['AKIAJZAYIMTC47C4LRPA'],
      :secret_access_key => ENV['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']
    }
end

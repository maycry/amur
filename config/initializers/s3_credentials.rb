if Rails.env == "production" 
   S3_CREDENTIALS = { :access_key_id => ENV['AKIAJZAYIMTC47C4LRPA'], :secret_access_key => ENV['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'], :bucket => "pics.lasposadress.com.ua"} 
 else 
   S3_CREDENTIALS = Rails.root.join("config/s3.yml")
end
class Member < ActiveRecord::Base
  
  has_attached_file :photo, 
    :styles => { 
      :medium => ["400x", :jpg], 
      :small => ["100x", :jpg],
      :original => ["100%", :jpg]
    },
    :storage => :s3,
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
      :bucket => ENV['S3_BUCKET_NAME']
    }
    
end

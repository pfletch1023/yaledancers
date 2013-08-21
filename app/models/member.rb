class Member < ActiveRecord::Base
  
  attr_accessible :name, :college, :year, :bio, :photo
  
  validates :name, presence: true

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
  
  def as_json(options = {})
    super(only: [:id, :name, :college, :year, :bio]).merge({
      photo: {
        small: self.photo.url(:small),
        medium: self.photo.url(:medium),
        original: self.photo.url(:original)
      }
    })
  end
    
end

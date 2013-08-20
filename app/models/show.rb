class Show < ActiveRecord::Base
  
  attr_accessible :name, :location, :student_price, :non_student_price, :photo
  
  has_many :performances
  
  validates :name, presence: true

  has_attached_file :photo, 
    :styles => { 
      large: ["800x", :jpg],
      medium: ["500x", :jpg], 
      small: ["100x", :jpg],
      original: ["100%", :jpg]
    },
    storage: :s3,
    s3_credentials: {
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      bucket: ENV['S3_BUCKET_NAME']
    }
  
  def as_json(options = {})
    super(only: [:id, :name, :location, :student_price, :non_student_price]).merge({
      photo: {
        small: self.photo.url(:small),
        medium: self.photo.url(:medium),
        large: self.photo.url(:large),
        original: self.photo.url(:original)
      },
      performances: self.performances
    })
  end
  
end

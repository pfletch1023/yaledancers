module YaleDancers::FlickrApiClient
    
  def self.get_photos(user_id = nil)
    p ENV['FLICKR_USER_ID']
    flickr.people.getPublicPhotos(
      user_id: user_id || ENV['FLICKR_USER_ID'],
      extras: "o_dims, description, url_s, url_m, url_o, date_taken"
    )
  end
  
  def self.get_photo_url(photo_object)
    FlickRaw.url_b(photo_object)
  end
  
end

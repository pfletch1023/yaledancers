module YaleDancers::FlickrApiClient
    
  def self.get_photos
    flickr.people.getPublicPhotos(user_id: ENV['FLICKR_USER_ID'])
  end
  
  def self.get_photo_url(photo_object)
    FlickRaw.url_b(photo_object)
  end
  
end

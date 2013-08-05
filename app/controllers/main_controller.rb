class MainController < ApplicationController
  
  include YaleDancers::FlickrApiClient
  
  def root
    @photos = YaleDancers::FlickrApiClient.get_photos
    @photo_urls = @photos.map{|photo| YaleDancers::FlickrApiClient.get_photo_url(photo)}
  end
end

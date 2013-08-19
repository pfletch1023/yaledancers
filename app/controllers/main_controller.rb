class MainController < ApplicationController
  
  include YaleDancers::FlickrApiClient
  
  def root
  end
  
  def photos
    @photos = YaleDancers::FlickrApiClient.get_photos
    render json: @photos
  end
  
  def admin
  end
    
end

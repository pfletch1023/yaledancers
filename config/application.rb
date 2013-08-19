require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module YaleDancers
  class Application < Rails::Application
    
    # Include modules
    config.autoload_paths += %W(#{config.root}/lib)
    
    # Load credentials file
    unless Rails.env.production?
      credentials = YAML.load_file("#{Rails.root}/config/credentials.yml")
      ENV['AWS_ACCESS_KEY_ID'] = credentials['AWS_ACCESS_KEY_ID']
      ENV['AWS_SECRET_ACCESS_KEY'] = credentials['AWS_SECRET_ACCESS_KEY']
      ENV['S3_BUCKET_NAME'] = credentials['S3_BUCKET_NAME']
      ENV['FLICKR_API_KEY'] = credentials['FLICKR_API_KEY']
      ENV['FLICKR_SECRET'] = credentials['FLICKR_SECRET']
      ENV['FLICKR_USER_ID'] = credentials['FLICKR_USER_ID']
    end
    
    FlickRaw.api_key = ENV['FLICKR_API_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_SECRET']
  end
end

class YaleDancers.Models.Photo extends Backbone.Model
  paramRoot: 'photo'

  defaults:
    datetaken: null
    description: null
    height_s: null
    width_s: null
    title: null
    url_o: null
    url_m: null
    url_s: null
    

class YaleDancers.Collections.Photos extends Backbone.Collection
  model: YaleDancers.Models.Photo
  url: '/photos'

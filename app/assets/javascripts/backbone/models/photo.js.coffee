class YaleDancers.Models.Photo extends Backbone.Model
  paramRoot: 'photo'

  defaults:
    url: null

class YaleDancers.Collections.PhotosCollection extends Backbone.Collection
  model: YaleDancers.Models.Photo
  url: '/photos'

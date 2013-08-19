class YaleDancers.Models.Show extends Backbone.Model
  paramRoot: 'show'

  defaults:
    name: null

class YaleDancers.Collections.Shows extends Backbone.Collection
  model: YaleDancers.Models.Show
  url: '/shows'

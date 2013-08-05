class YaleDancers.Router extends Backbone.Router
  
  initialize: (options) ->
    @view = new YaleDancers.Views.Index()
  
  routes:
    'members' : 'members'
    'about' : 'about'
    'gallery' : 'gallery'
    'contact' : 'contact'
    '.*' : 'index'
  
  index: ->
    @view.closeNav()
    @view.render()
  
  members: ->
    @view.closeNav()
  
  about: ->
    @view.closeNav()
  
  gallery: ->
    @view.closeNav()
  
  contact: ->
    @view.closeNav()
class YaleDancers.Router extends Backbone.Router
  
  initialize: (options) ->
    @view = new YaleDancers.Views.Index
  
  routes:
    'members' : 'members'
    'about' : 'about'
    'gallery' : 'gallery'
    'contact' : 'contact'
    '.*' : 'index'
  
  index: ->
    @view.closeNav()
    if @showsCollection
      @view.render(@showsCollection)
    else
      @showsCollection = new YaleDancers.Collections.Shows
      @showsCollection.fetch success: (data) =>
        @index()
  
  members: ->
    @view.closeNav()
    if @membersCollection
      @membersView = new YaleDancers.Views.Members unless @membersView
      @membersView.render(@membersCollection)
    else
      @membersCollection = new YaleDancers.Collections.Members
      @membersCollection.fetch success: (data) =>
        @members()
      
  about: ->
    @view.closeNav()
    @view.renderAbout()
  
  gallery: ->
    @view.closeNav()
    $('body').addClass 'loading'
    if @photos
      $('body').removeClass 'loading'
      @galleryView = new YaleDancers.Views.Gallery unless @galleryView
      @galleryView.render(@photos)
    else
      @photos = new YaleDancers.Collections.Photos
      @photos.fetch success: (data) =>
        @gallery()
      
  contact: ->
    @view.closeNav()
    @view.renderContactUs()
    
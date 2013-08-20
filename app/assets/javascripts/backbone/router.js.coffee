class YaleDancers.Router extends Backbone.Router
  
  initialize: (options) ->
    @view = new YaleDancers.Views.Index
  
  routes:
    'shows/:id' : 'show'
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
  
  show: (id) ->
    @view.closeNav()
    if @showsCollection
      @showView = new YaleDancers.Views.Show unless @showView
      @showView.render(@showsCollection.get(id))
    else
      show = new YaleDancers.Models.Show
      show.url = "/shows/#{id}"
      show.fetch success: (data) =>
        @showView = new YaleDancers.Views.Show unless @showView
        @showView.render(show)
    
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
    
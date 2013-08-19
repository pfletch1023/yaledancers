YaleDancers.Views ||= {}

class YaleDancers.Views.Index extends Backbone.View
  
  template: JST["backbone/templates/base"]
  indexTemplate: JST["backbone/templates/index"]
  aboutTemplate: JST["backbone/templates/about"]
  contactUsTemplate: JST["backbone/templates/contact_us"]
  
  el: "body"
  container: ".container"

  initialize: ->
    $(@el).html @template()
  
  render: (shows) ->
    $(@container).html @indexTemplate(shows: shows)
  
  renderAbout: ->
    $(@container).html @aboutTemplate()
  
  renderContactUs: ->
    $(@container).html @contactUsTemplate()
  
  events:
    "click .open-nav-links" : "openNav"
    "click #tickets-button" : "openFeaturedInfo"
  
  openNav: (event) ->
    if $('.nav').hasClass 'open'
      @closeNav()
    else
      $('.nav').addClass 'open'
      $('.open-nav-links').html '<i class="icon-double-angle-left"></i>'

  closeNav: ->
    $('.nav').removeClass 'open'
    $('.open-nav-links').html '<i class="icon-reorder"></i>'
      
  openFeaturedInfo: (event) ->
    id = $(event.target).data("id")
    $(".featured-info").slideDown(150)

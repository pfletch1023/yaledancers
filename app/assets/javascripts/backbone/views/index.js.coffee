YaleDancers.Views ||= {}

class YaleDancers.Views.Index extends Backbone.View
  
  template: JST["backbone/templates/index"]
  
  el: "body"

  initialize: ->
    $(@el).html( @template() )
  
  render: ->
    console.log 'render'
  
  events:
    "click .open-nav-links" : "openNav"
  
  openNav: (event) ->
    if $('.nav').hasClass 'open'
      @closeNav()
    else
      $('.nav').addClass 'open'
      $('.open-nav-links').html '<i class="icon-double-angle-left"></i>'

  closeNav: ->
    $('.nav').removeClass 'open'
    $('.open-nav-links').html '<i class="icon-reorder"></i>'
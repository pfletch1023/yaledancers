YaleDancers.Views ||= {}

class YaleDancers.Views.Show extends Backbone.View
  
  template: JST["backbone/templates/show"]
  
  el: ".container"
  
  render: (show) ->
    console.log show
    $(@el).html @template(show: show)
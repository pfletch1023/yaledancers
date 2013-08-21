YaleDancers.Views ||= {}

class YaleDancers.Views.Members extends Backbone.View
  
  template: JST["backbone/templates/members/index"]
  memberTemplate: JST["backbone/templates/members/show"]
  
  el: ".container"
  content: "#members-show"
  
  initialize: ->
    resize = _.debounce(@resize, 100)
    $(window).on("resize", resize)
  
  resize: =>
    @render(@members)
    
  render: (members) ->
    @members = members
    num = Math.floor($(@el).width() / 250)
    $(@el).html @template(members: @members, numColumns: num)
  
  events: 
    "click .member" : "showMember"
  
  showMember: (event) ->
    $target = $(event.target).closest(".member")
    if $target.hasClass "open"
      $target.removeClass "open"
      $(".member-bio", $target).slideUp(150)
    else
      $target.addClass "open"
      $(".member-bio", $target).slideDown(150)
      
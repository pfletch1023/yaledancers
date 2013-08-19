YaleDancers.Views ||= {}

class YaleDancers.Views.Members extends Backbone.View
  
  template: JST["backbone/templates/members/index"]
  memberTemplate: JST["backbone/templates/members/show"]
  
  el: ".container"
  content: "#members-show"
  
  render: (members) ->
    @members = members
    $(@el).html @template(members: @members)
  
  events: 
    "click .member" : "showMember"
  
  showMember: (event) ->
    id = $(event.target).closest("a").data("id")
    member = @members.get(id)
    $(@content).css("background-image", "url(#{member.get('original_url')})")
    $(@content).html @memberTemplate(member.toJSON())
    
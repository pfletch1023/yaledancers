class YaleDancers.Models.Member extends Backbone.Model
  paramRoot: 'member'

  defaults:
    name: null
    college: null
    year: null
    bio: null

class YaleDancers.Collections.MembersCollection extends Backbone.Collection
  model: YaleDancers.Models.Member
  url: '/members'

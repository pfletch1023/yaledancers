class YaleDancers.Models.Row extends Backbone.Model

  minHeight: 160
  maxHeight: 220
  photoPadding: 4
  
  defaults:
    height: 300
    id: null
  
  isEmpty: ->
    !@get("photos") || @get("photos").length == 0
  
  canFitPhoto: (photo, width) ->
    minWidths = []
    for p in @get("photos").models
      minWidths.push (@minHeight / (p.get("height_s") / p.get("width_s"))) + @photoPadding * 2
    extraWidth = (@minHeight / (photo.get("height_s") / photo.get("width_s"))) + @photoPadding * 2
    if @sum(minWidths) + extraWidth <= width
      @set height: Math.min width * (@minHeight / (@sum(minWidths) + extraWidth)), @maxHeight
      @get("photos").add photo
      true
    else
      false
  
  sum: (array) ->
    array.reduce (x, y) -> x + y

class YaleDancers.Collections.Rows extends Backbone.Collection
  model: YaleDancers.Models.Row

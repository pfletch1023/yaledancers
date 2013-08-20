YaleDancers.Views ||= {}

class YaleDancers.Views.Gallery extends Backbone.View
  
  template: JST["backbone/templates/gallery/index"]
  rowTemplate: JST["backbone/templates/gallery/row"]
  photoTemplate: JST["backbone/templates/gallery/photo"]
  
  el: ".container"
  content: "#gallery"
  
  render: (photos) ->
    @photos = photos
    $(@el).html @template()
    @addAll()
  
  addRow: (collection, index) ->
    row = new YaleDancers.Models.Row(id: index)
    collection.add row
  
  renderRows: (rows) ->
    for row in rows.models
      $(@content).append @rowTemplate(row.toJSON())
    
  addAll: ->
    rows = new YaleDancers.Collections.Rows
    @addRow(rows, 0)
    currentRow = rows.get(0)
    for photo in @photos.models
      if currentRow.isEmpty()
        currentRow.set photos: new YaleDancers.Collections.Photos(photo)
      else if currentRow.canFitPhoto(photo, $(@content).width())
        currentRow.get("photos").add photo
      else
        newIndex = currentRow.id++
        @addRow(rows, newIndex)
        currentRow = rows.get(newIndex)
        currentRow.set photos: new YaleDancers.Collections.Photos(photo)
    @renderRows(rows)

  events: 
    "click .gallery-photo" : "openPhoto"
    "click .close-popover" : "closePhoto"
  
  openPhoto: (event) ->
    id = $(event.target).data("id")
    $("#popover").addClass "open"
    #console.log @photos.get(id)
    $("#popover").html @photoTemplate(@photos.get(id).toJSON())
    $(".large-photo img").load ->
      $(".large-photo").fadeIn(200)
  
  closePhoto: (event) ->
    $("#popover").removeClass "open"
    $("#popover").html ""
    

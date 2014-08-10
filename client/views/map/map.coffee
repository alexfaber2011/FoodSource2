Template.map.rendered = ->
  tmpl = this
  VazcoMaps.init {}, ->
    tmpl.mapEngine = VazcoMaps.gMaps()
    #Default to Madison for now
    tmpl.newMap2 = new tmpl.mapEngine(
      div: "#map-canvas2"
      lat: 43.0667
      lng: -89.4000
      zoom: 14
    )

    #Add offered meals
    offeredMeals = OfferedMeals.find();
    offeredMeals.observe
      added: (document) ->
        tmpl.newMap2.addMarker
          lat: document.lat
          lng: document.lng

  #Size the map properly
  window_height = $(window).height()
  $("#map-canvas2").height(window_height)

  #Resize the map when the window resizes as well
  $(window).resize(->
    window_height = $(window).height()
    $("#map-canvas2").height(window_height)
  )

Template.map.helpers

Template.map.events
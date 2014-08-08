Template.map.rendered = ->
  tmpl = this
  VazcoMaps.init {}, ->
    tmpl.mapEngine = VazcoMaps.gMaps()
    tmpl.newMap2 = new tmpl.mapEngine(
      div: "#map-canvas2"
      lat: 43.0667
      lng: -89.4000
      zoom: 14
    )

  window_height = $(window).height()
  console.log window_height
  $("#map-canvas2").css("height", "#{window_height} !important")
  $("#map-canvas2").height(window_height)

  #Resize the map when the window resizes as well
  $(window).resize(->
    window_height = $(window).height()
    console.log window_height
    $("#map-canvas2").css("height", "#{window_height} !important")
    $("#map-canvas2").height(window_height)
  )
Template.map.helpers

Template.map.events
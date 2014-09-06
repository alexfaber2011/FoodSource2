displayModal = (title) ->
  console.log "[displayModal] called"
  modalInfo =
    template: Template.modalInfo
    title: title

  rd = ReactiveModal.initDialog(modalInfo)
  rd.show()

Template.map.rendered = ->
  #send the user your condolences
  alertify.error "Your map may look funky.  If it does, please refresh or resize your window.  We're working on this"

  Session.setDefault "isOfferedMarker", no
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
    offeredMeals = OfferedMeals.find({available: yes});
    offeredMeals.observe
      added: (document) ->
        tmpl.newMap2.addMarker
          icon: 'food.png'
          lat: document.lat
          lng: document.lng
          click: (marker) ->
            Session.set "markerLng", accounting.toFixed(marker.getPosition().lng(), 10)
            Session.set "markerLat", accounting.toFixed(marker.getPosition().lat(), 10)
            Session.set "isOfferedMarker", yes
            displayModal "Offered Meals"

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
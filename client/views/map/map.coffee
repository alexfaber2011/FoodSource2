displayModal = (title) ->
  console.log "[displayModal] called"
  modalInfo =
    template: Template.modalInfo
    title: title
#    modalDialogClass: "share-modal-dialog" #optional
#    modalBodyClass: "share-modal-body" #optional
#    modalFooterClass: "share-modal-footer" #optional
    buttons:
      cancel:
        class: "btn-danger"
        label: "Cancel"
      ok:
        closeModalOnClick: false # if this is false, dialog doesnt close automatically on click
        class: "btn-info"
        label: "Ok"

  rd = ReactiveModal.initDialog(modalInfo)
  rd.show()

Template.map.rendered = ->
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
    offeredMeals = OfferedMeals.find();
    offeredMeals.observe
      added: (document) ->
        tmpl.newMap2.addMarker
          icon: 'food.png'
          lat: document.lat
          lng: document.lng
          click: (marker) ->
            Session.set "markerLng", accounting.toFixed(marker.getPosition().lng(), 10)
            Session.set "markerLat", accounting.toFixed(marker.getPosition().lat(), 10)
#            Session.set "markerLng", accounting.toFixed(@.position.B, 6)
#            Session.set "markerLat", accounting.toFixed(@.position.k, 6)
            Session.set "isOfferedMarker", yes
            displayModal "Offered Meals"
						
    #Add requested meals
    requestedMeals = RequestedMeals.find();
    requestedMeals.observe
      added: (document) ->
        tmpl.newMap2.addMarker
          icon: 'fork.png'
          lat: document.lat
          lng: document.lng
          click: ->
            Session.set "markerLng", (@.position.B).toFixed(2)
            Session.set "markerLat", (@.position.k).toFixed(2)
            Session.set "isRequestedMarker", yes
            displayModal "Requested Meals"


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
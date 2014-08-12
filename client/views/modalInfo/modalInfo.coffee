Template.modalInfo.rendered = ->

Template.modalInfo.helpers
  meals: ->
    isOfferedMarker = Session.get "isOfferedMarker"
    lat = Session.get "markerLat"
    lng = Session.get "markerLng"
    if isOfferedMarker is true and lat and lng
      meals = OfferedMeals.find
        lat: lat
        lng: lng
#      console.log meals.fetch()
      return meals





Template.modalInfo.events
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
        available: yes
      return meals

  userFullName: (_id) ->
    user = Meteor.users.findOne(_id: _id)
    Session.set "userRating", user.profile.rating
    return user.profile.name


  rating: ->
    #A bit hackish...
    Session.get "userRating"

Template.modalInfo.events
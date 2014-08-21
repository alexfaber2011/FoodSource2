

AutoForm.hooks
  insertOfferedMealsForm:
    before:
      insert: (doc) ->
        console.log doc
        HTTP.get "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyCbB-_YPraSIeF3_J4dcKahG77KLdY5G64&address=" + doc.address, (error, geocoded) ->
          if error
            console.log error
            throw new Meteor.Error(500)
          else
  #            console.log geocoded
            lat = parseFloat(accounting.toFixed(geocoded.data.results[0].geometry.location.lat, 10))
            lng = parseFloat(accounting.toFixed(geocoded.data.results[0].geometry.location.lng, 10))
            if lat then Session.set "docLat", lat
            if lng then Session.set "docLng", lng
        lat = Session.get "docLat"
        lng = Session.get "docLng"
        if lat and lng
          doc.lat = lat
          doc.lng = lng
          console.log doc
          return doc

Template.createOfferedMeal.rendered = ->

Template.createOfferedMeal.helpers

Template.createOfferedMeal.events
#  "submit form": (event) ->
#    event.preventDefault()
#
#    ##TODO: convert this to autoform; add validation
#    address = $(event.target).find("[id=streetAddress]").val() + " " + $(event.target).find("[id=city]").val() + " " + $(event.target).find("[id=state]").val() + " " + $(event.target).find("[id=zip]").val()
#    HTTP.get "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyCbB-_YPraSIeF3_J4dcKahG77KLdY5G64&address=" + address, (error, geocoded) ->
#      if error
#        throw new Meteor.Error(500)
#      else
#        console.log geocoded
#        lat = accounting.toFixed(geocoded.data.results[0].geometry.location.lat, 10)
#        lng = accounting.toFixed(geocoded.data.results[0].geometry.location.lng, 10)
#        food =
#          name: $(event.target).find("[id=foodName]").val()
#          lat: lat
#          lng: lng
#
#        OfferedMeals.insert food
#      return
#
#    return
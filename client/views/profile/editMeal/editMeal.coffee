Template.editMeal.rendered = ->

Template.editMeal.helpers
  meal: ->
    id = Session.get "clickedProfileMeal"
    OfferedMeals.findOne _id: id

  checked: (available) ->
    if available
      return "checked"
    else
      return ""

  'createOfferedMealError': ->
    return Session.get("createOfferedMealError")

  'createOfferedMealSuccess': ->
    return Session.get("createOfferedMealSuccess")

  isAvailable: (_id) ->
    if OfferedMeals.findOne(_id: _id).available
      return "btn-success"
    else
      return "btn-default"

Template.editMeal.events
  "submit #editOfferedMeal": (event) ->
    #Update everything, as much as you can
    event.preventDefault()

    #TODO: convert this to autoform; add validation
    address = $(event.target).find("#streetAddress").val()
    console.log address

    HTTP.get "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyCbB-_YPraSIeF3_J4dcKahG77KLdY5G64&address=" + address, (error, geocoded) ->
      if error
        console.log error
        Session.set "createOfferedMealError", "Address is invalid"
        Session.set "createOfferedMealSuccess", `undefined`
        throw new Meteor.Error(500)
      else
#        console.log geocoded
        if geocoded.data.results.length is 0
          Session.set "createOfferedMealError", "Address is invalid"
          Session.set "createOfferedMealSuccess", `undefined`
        else
          Session.set "createOfferedMealError", `undefined`
          Session.set "createOfferedMealSuccess", "Meal Edited Successfully"
          setTimeout (->
            Session.set "createOfferedMealSuccess", `undefined`
            return
          ), 5000
          lat = accounting.toFixed(geocoded.data.results[0].geometry.location.lat, 10)
          lng = accounting.toFixed(geocoded.data.results[0].geometry.location.lng, 10)
          food =
            name: $(event.target).find("#foodName").val()
            lat: lat
            lng: lng
            address: address
            description: $(event.target).find("#description").val()
            numOfServings: $(event.target).find("#numOfServings").val()
            available: $("#available").is( ":checked" )
          console.log '[$("#available").is( ":checked" )]', $("#available").is( ":checked" )
          OfferedMeals.update
            _id: Session.get("clickedProfileMeal")
          ,
            $set: food
          ,
            (error, numAffected) ->
              if error
                console.log error
              else
                console.log numAffected
      return
  "click [name='available']": ->
    console.log $("#is-available").prop("checked", true)
    console.log $("#is-not-available").prop("checked", true)
#    console.log $('input[name="available"]').val()

  "click #meal-available": ->
    _id = $("#meal-available").attr("_id")
    isAvailable = $("#meal-available").val()
#    console.log _id
#    console.log isAvailable
    OfferedMeals.update
      _id: _id
    ,
      $set:
        available: not isAvailable

Template.meal.rendered = ->

Template.meal.helpers
  chef: ->
    mealId = Session.get "mealId"
    if mealId
      meal = OfferedMeals.findOne(_id: mealId)
      userId = meal.userId
      Session.set "chefId", userId
      Meteor.users.findOne(_id: userId)

  meal: ->
    mealId = Session.get "mealId"
    if mealId
      OfferedMeals.findOne(_id: mealId)

  settings: ->
    rowsPerPage: 10
    showFilter: yes
    showNavigation: yes
    useFontAwesome: yes
    fields: [
      {
        key: "approved"
        label: "Approved"
        fn: (value) ->
          if value
            Spacebars.SafeString("<i class='fa fa-check'>")
          else
            Spacebars.SafeString("<i class='fa fa-times'>")
      }
      {
        key: "servings"
        label: "Servings"
      }
      {
        key: "user.profile.name"
        label: "Name"
      }
      {
        key: "user.username"
        label: "Username"
      }
      {
        key: "note"
        label: "Note"
      }
      {
        key: "user.profile.rating"
        label: "Rating"
        fn: (value) ->
          console.log value
          output = ""
          i = 0
          while i < value
            output += "<i class='fa fa-star'>"
            i++
          Spacebars.SafeString(output)
      }
    ]

  collection: ->
    mealId = Session.get "mealId"
    if mealId
      Claims.find(mealId: mealId)

  remainingServings: ->
    mealId = Session.get "mealId"
    if mealId
      servings = OfferedMeals.findOne(_id: mealId).numOfServings
      claims = Claims.find
        mealId: mealId
        approved: yes
      claims = claims.count()
      return servings - claims


Template.meal.events
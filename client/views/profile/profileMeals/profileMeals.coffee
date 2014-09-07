Template.profileMeals.rendered = ->
  #Make the rows of the meals table 'clickable' if the page isn't the user's
  ownsPage = Session.get "ownsPage"
  if not ownsPage
    $('.reactive-table tr').css("cursor", "pointer")

Template.profileMeals.helpers
  settings: ->
    rowsPerPage: 10
    showFilter: yes
    showNavigation: yes
    useFontAwesome: yes

    ownsPage = Session.get "ownsPage"
    if ownsPage
      fields: [
        {
          key: "available"
          label: "Available"
          fn: (value) ->
            if value
              Spacebars.SafeString("<i class='fa fa-check'>")
            else
              Spacebars.SafeString("<i class='fa fa-times'>")
        }
        {
          key: "name"
          label: "Name"
        }
        {
          key: "description"
          label: "Description"
        }
        {
          key: "numOfServings"
          label: "Served"
        }
        {
          key: "rating"
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
        {
          key: "_id"
          label: "Claims"
          fn: (_id) ->
            claims = Claims.find
              "meal._id": _id
            return claims.count()

        }
        {
          key: "_id"
          label: ""
          fn: (_id) ->
            return Spacebars.SafeString("<a href=\"/meal/#{_id}\"><button class=\"btn btn-default\">View Meal</button></a>")

        }
        {
          key: "_id"
          label: ""
          fn: (_id) ->
            return Spacebars.SafeString("<button id=\"edit-meal\" mealId=\"#{_id}\" class=\"btn btn-warning\">Edit</button>")
        }
      ]
    else
      fields: [
        {
          key: "available"
          label: "Available"
          fn: (value) ->
            if value
              Spacebars.SafeString("<i class='fa fa-check'>")
            else
              Spacebars.SafeString("<i class='fa fa-times'>")
        }
        {
          key: "name"
          label: "Name"
        }
        {
          key: "description"
          label: "Description"
        }
        {
          key: "numOfServings"
          label: "Served"
        }
        {
          key: "rating"
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
      group: "meals"

  collection: ->
    userId = Session.get "userId" #set in router
    if userId
      OfferedMeals.find
        userId: userId

Template.profileMeals.events
  "click #edit-meal": (event) ->
    mealId = $(event.currentTarget).attr("mealId")
    meal = OfferedMeals.findOne(_id: mealId)
    if meal
      if meal.userId is Meteor.userId()
        mealModal = {
          template: Template.editMeal
          title: "Edit Meal"
        }
      Session.set "clickedProfileMeal", meal._id
      rd = ReactiveModal.initDialog(mealModal)
      rd.show()

  "click .reactive-table tr": ->
    ownsPage = Session.get "ownsPage"
    if not ownsPage
      Router.go("/meal/#{@._id}")
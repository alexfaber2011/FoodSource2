Template.profileMeals.rendered = ->

Template.profileMeals.helpers
  settings: ->
    rowsPerPage: 10
    showFilter: yes
    showNavigation: yes
    useFontAwesome: yes
    group: 'meals'
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
          claim = Claims.findOne
            "meal._id": _id
          if claim
            return Spacebars.SafeString("<a href=\"/meal/#{_id}\"><button class=\"btn btn-default\">View Claims</button></a>")
          else
            return ""

      }
    ]

  collection: ->
    userId = Session.get "userId" #set in router
    if userId
      OfferedMeals.find
        userId: userId

Template.profileMeals.events
  "click .reactive-table tr": (event) ->
    console.log "row: ", @
    if @.userId is Meteor.userId()
      mealModal = {
        template: Template.editMeal
        title: "Edit Meal"
      }
    else
      mealModal = {
        template: Template.viewMeal
        title: "View Meal"
      }
    Session.set "clickedProfileMeal", @._id
    rd = ReactiveModal.initDialog(mealModal)
    rd.show()
Template.profile.rendered = ->

Template.profile.helpers
  settings: ->
    rowsPerPage: 10
    showFilter: yes
    showNavigation: yes
    useFontAwesome: yes
    group: 'addresses'
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

  collection: ->
    OfferedMeals.find
      userId: Meteor.userId()

  ownsPage: ->
    Session.get "ownsPage"

  user: ->
    Meteor.user()


Template.profile.events
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
    rd = ReactiveModal.initDialog(mealModal);
    rd.show()

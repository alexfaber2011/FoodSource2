Template.profileClaims.rendered = ->
  $('.reactive-table tr').css("cursor", "pointer")

Template.profileClaims.helpers
  claims: ->
    Claims.find
      "user._id": Meteor.userId()

  claimsSettings: ->
    rowsPerPage: 10
    showFilter: yes
    showNavigation: yes
    useFontAwesome: yes
    ownsPage = Session.get "ownsPage"
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
        key: "meal.chefName"
        label: "Chef Username"
      }
      {
        key: "meal.name"
        label: "Dish"
      }
      {
        key: "meal.address"
        label: "Address"
      }
    ]
    group: "claims"


Template.profileClaims.events
  "click .reactive-table tr": ->
    Router.go("/meal/#{@.meal._id}")

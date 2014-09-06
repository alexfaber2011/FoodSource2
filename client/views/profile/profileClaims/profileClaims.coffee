Template.profileClaims.rendered = ->

Template.profileClaims.helpers
  claims: ->
    Claims.find
      "user._id": Meteor.userId()

  claimsSettings: ->
    rowsPerPage: 10
    showFilter: yes
    showNavigation: yes
    useFontAwesome: yes
    group: "claims"
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


Template.profileClaims.events
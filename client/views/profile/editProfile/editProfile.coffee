Template.editProfile.rendered = ->

Template.editProfile.helpers
  user: ->
    Meteor.user()

Template.editProfile.events
  "submit #editProfile": (event) ->
    event.preventDefault()

    name = $("#name").val()
    address = $("#address").val()
    specialty = $("#specialty").val()


    Meteor.users.update
      _id: Meteor.userId()
    ,
      $set:
        profile:
            name: name
            address: address
            specialty: specialty

    alertify.success("Profile Successfully Updated")


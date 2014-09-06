Template.profile.rendered = ->

Template.profile.helpers
  ownsPage: ->
    Session.get "ownsPage"

  user: ->
    userId = Session.get "userId" #set in router
    if userId
      console.log userId
      user = Meteor.users.findOne
        _id: userId
      console.log user
      return user


Template.profile.events

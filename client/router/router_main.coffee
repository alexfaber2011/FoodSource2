mustBeSignedIn = ->
  if not Meteor.userId()
    Router.go "home"

Router.configure
  layoutTemplate: "layout"
#  notFoundTemplate: "notfound"
#  loadingTemplate: "loading"

#For reference.  We're routing on the client side, so this isn't entirely secure, but it doesn't really matter much,
# security comes from publishing data. Server side routing is available but not necessary here
Router.onBeforeAction mustBeSignedIn,
  except: [
    "home"
  ]

Router.map ->
  @route "map",
    path: "/map"
    onBeforeAction: ->
    data: ->
      Meteor.subscribe "RequestedMeals"
      Meteor.subscribe "UserData"

  @route "home",
    path: "/"

  @route "profile",
    path: "/profile/:id"
    onBeforeAction: ->
      if @params.id is Meteor.userId()
        #Allow the user to edit their info
        Session.set "ownsPage", yes
      else
        Session.set "ownsPage", no
      Session.set "userId", @params.id
    data: ->
      Meteor.subscribe "OfferedMeals"
      Meteor.subscribe "UserData"
      Meteor.subscribe "Claims"

  @route "meal",
    path: "/meal/:mealId"
    onBeforeAction: ->
      Session.set "mealId", @params.mealId
    data: ->
      Meteor.subscribe "OfferedMeals"
      Meteor.subscribe "Claims"
      Meteor.subscribe "UserData"
      Meteor.subscribe "Reviews"


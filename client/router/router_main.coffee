Router.configure
  layoutTemplate: "layout"
#  notFoundTemplate: "notfound"
#  loadingTemplate: "loading"

Router.map ->
  @route "map",
    path: "/map"
    #For reference.  We're routing on the client side, so this isn't entirely secure, but it doesn't really matter much,
    # security comes from publishing data. Server side routing is available but not necessary here
    onBeforeAction: ->
      if not Meteor.userId()
        Router.go "home"
    data: ->
      Meteor.subscribe "OfferedMeals"
#      Meteor.subscribe "RequestedMeals"

  @route "home",
    path: "/"
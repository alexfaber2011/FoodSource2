Router.configure
  layoutTemplate: "layout"
#  notFoundTemplate: "notfound"
#  loadingTemplate: "loading"

Router.map ->
  @route "main",
    path: "/"
    data: ->
      Meteor.subscribe "OfferedMeals"
      Meteor.subscribe "RequestedMeals"
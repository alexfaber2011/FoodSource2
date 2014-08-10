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
  
  @route "test",
    path: "test"

  #TODO move this to a better spot (temp)
  @route "map",
    path: "map"
Router.configure
  layoutTemplate: "layout"

Router.map ->
  @route "test",
    path: "test"

  #TODO move this to a better spot (temp)
  @route "map",
    path: "map"
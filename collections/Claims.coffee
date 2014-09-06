@Claims = new Meteor.Collection('Claims')

@Claims.allow
#THIS NEEDS TO BE SERIOUSLY TIGHTENED DOWN IN THE FUTURE
  insert: (userId, doc) ->
    yes
  update: (userId, doc) ->
    yes
  remove: (userId, doc) ->
    yes

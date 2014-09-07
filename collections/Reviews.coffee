@Reviews = new Meteor.Collection('Reviews')

@Reviews.allow
#THIS NEEDS TO BE SERIOUSLY TIGHTENED DOWN IN THE FUTURE
  insert: (userId, doc) ->
    yes
  update: (userId, doc) ->
    yes
  remove: (userId, doc) ->
    yes

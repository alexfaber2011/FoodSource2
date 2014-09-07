Meteor.methods
  updateUserRating: (chefId, rating) ->
    #update the chef's rating
    chef = Meteor.users.findOne(_id: chefId)
    #average the ratings
    console.log "[updateUserRating] rating: ", rating
#    console.log "[updateUserRating] chef.profile.rating (before): ", chef.profile.rating
    ratings = chef.profile.ratings
    ratings.push rating
    rating =
    console.log "[updateUserRating] chef.profile.rating (after): ", chef.profile.rating
    Meteor.users.update
      _id: chefId
    ,
      $set:
        "profile.numOfRatings": numOfRatings
        "profile.ratings": newRating
    ,
      (error, count) ->
        if error
          throw new Meteor.Error 500, "Failed to update rating", "Failed to update rating"
        else
          return true
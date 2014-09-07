Template.review.rendered = ->

Template.review.helpers

Template.review.events
  "submit #review": (event) ->
    event.preventDefault()

    rating = Number($("#rating").val())
    justification = $("#justification").val()
    title = $("#title").val()
    mealId = Session.get "mealId"
    chefId = Session.get "chefId"

    console.log mealId
    console.log chefId
    console.log title
    console.log justification
    console.log rating

    if justification and title and mealId and chefId
      Reviews.insert
        rating: rating
        title: title
        justification: justification
        mealId: mealId
        chefId: chefId
        reviewerId: Meteor.userId()
      ,
        (error, _id) ->
          if error
            alertify.error(error)
          else
            Meteor.call "updateUserRating", chefId, rating, (error) ->
              if error
                alertify.error(error)
              else
                alertify.success("Thank you.  Your review has been submitted")
    else
      alertify.error("Please fill all fields")

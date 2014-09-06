Template.claim.rendered = ->

Template.claim.helpers

Template.claim.events
  "submit #claim": (event) ->
    event.preventDefault()

    numOfServings = Number($("#numOfServings").val())
    note = $("#note").val()

#    console.log numOfServings
#    console.log note

    meal = OfferedMeals.findOne(_id: Session.get("mealId"))
    user = Meteor.user()
    chefId = Session.get("chefId")

    if meal and user and chefId
      Claims.insert
        meal:
          _id: meal._id
          name: meal.name
          address: meal.address
          chefName: meal.userName
          description: meal.description
        userId: user._id
        user: user
        chefId: chefId
        servings: numOfServings
        note: note
        approved: false
      ,
        (error, _id) ->
          if error
            console.log error
          else
            alertify.success("Claim Sent.  Please wait for the Chef to approve your claim before picking up.")


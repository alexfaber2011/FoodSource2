Template.claim.rendered = ->

Template.claim.helpers

Template.claim.events
  "submit #claim": (event) ->
    event.preventDefault()

    numOfServings = Number($("#numOfServings").val())
    note = $("#note").val()

#    console.log numOfServings
#    console.log note

    mealId = Session.get("mealId")
    user = Meteor.user()
    chefId = Session.get("chefId")

    if mealId and user and chefId
      Claims.insert
        mealId: mealId
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


Template.meal.rendered = ->

Template.meal.helpers
  chef: ->
    mealId = Session.get "mealId"
    if mealId
      meal = OfferedMeals.findOne(_id: mealId)
      userId = meal.userId
      Session.set "chefId", userId
      Meteor.users.findOne(_id: userId)

  meal: ->
    mealId = Session.get "mealId"
    if mealId
      OfferedMeals.findOne(_id: mealId)

  settings: ->
    rowsPerPage: 10
    showFilter: yes
    showNavigation: yes
    useFontAwesome: yes

    #Present different fields depending on if user owns meal
    mealId = Session.get "mealId"
    if mealId
      ownsMeal = OfferedMeals.findOne(_id: mealId).userId is Meteor.userId()

    if ownsMeal
      fields: [
        {
          key: "approved"
          label: "Approved"
          fn: (value) ->
            if value
              Spacebars.SafeString("<i class='fa fa-check'>")
            else
              Spacebars.SafeString("<i class='fa fa-times'>")
        }
        {
          key: "servings"
          label: "Servings"
        }
        {
          key: "user.profile.name"
          label: "Name"
        }
        {
          key: "user"
          label: "Username"
          fn: (user) ->

            return Spacebars.SafeString("<a href=\"/profile/#{user._id}\">#{user.username}</a>")
        }
        {
          key: "note"
          label: "Note"
        }
        {
          key: "user.profile.rating"
          label: "Rating"
          fn: (value) ->
            console.log value
            output = ""
            i = 0
            while i < value
              output += "<i class='fa fa-star'>"
              i++
            Spacebars.SafeString(output)
        }
        {
          key: "_id"
          label: ""
          fn: (value, object) ->
            console.log object
            if object.approved
              Spacebars.SafeString("<button id=\"disapprove\" class=\"btn btn-default\" claimId=\"#{object._id}\">Disapprove</button>")
            else
              Spacebars.SafeString("<button id=\"approve\" class=\"btn btn-default\" claimId=\"#{object._id}\">Approve</button>")
        }
      ]
    else
      fields: [
        {
          key: "approved"
          label: "Approved"
          fn: (value) ->
            if value
              Spacebars.SafeString("<i class='fa fa-check'>")
            else
              Spacebars.SafeString("<i class='fa fa-times'>")
        }
        {
          key: "servings"
          label: "Servings"
        }
        {
          key: "user.profile.name"
          label: "Name"
        }
        {
          key: "user"
          label: "Username"
          fn: (user) ->

            return Spacebars.SafeString("<a href=\"/profile/#{user._id}\">#{user.username}</a>")
        }
        {
          key: "note"
          label: "Note"
        }
        {
          key: "user.profile.rating"
          label: "Rating"
          fn: (value) ->
            console.log value
            output = ""
            i = 0
            while i < value
              output += "<i class='fa fa-star'>"
              i++
            Spacebars.SafeString(output)
        }
      ]

  collection: ->
    mealId = Session.get "mealId"
    if mealId
      Claims.find("meal._id": mealId)

  remainingServings: ->
    mealId = Session.get "mealId"
    if mealId
      servings = Number(OfferedMeals.findOne(_id: mealId).numOfServings)
      claims = Claims.find
        "meal._id": mealId
        approved: yes
      claimedServings = 0
      for claim in claims.fetch()
        claimedServings += claim.servings
      console.log "[remainingServings] claimedServings: ", claimedServings
      return servings - claimedServings

  disable: ->
    claim = Claims.findOne
      "user._id": Meteor.userId()
      approved: yes
#    console.log claim
    if claim
      console.log "not disabling"
      return ""
    else
      console.log "disabling"
      return "disabled"



Template.meal.events
  "click #approve": (event) ->
    claimId = $(event.currentTarget).attr("claimId")
    Claims.update
      _id: claimId
    ,
      $set:
        approved: true

  "click #disapprove": (event) ->
    claimId = $(event.currentTarget).attr("claimId")
    Claims.update
      _id: claimId
    ,
      $set:
        approved: false

  "click #claim": ->
    claim =
      template: Template.claim
      title: "Claim a meal"
    rd = ReactiveModal.initDialog(claim)
    rd.show()
    return

  "click #review": ->
    review =
      template: Template.review
      title: "Leave a Review"
    rd = ReactiveModal.initDialog(review)
    rd.show()
    return

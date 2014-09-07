Template.mealReviews.rendered = ->

Template.mealReviews.helpers
  reviews: ->
    mealId = Session.get "mealId"
    if mealId
      Reviews.find
        mealId: mealId

  settings: ->
    rowsPerPage: 10
    showFilter: yes
    showNavigation: yes
    useFontAwesome: yes
    fields: [
      {
        key: "rating"
        label: "Rating"
        fn: (value) ->
          console.log value
          output = ""
          i = 1
          while i <= value
            output += "<i class='fa fa-star'>"
            i++
          Spacebars.SafeString(output)
      }
      {
        key: "title"
        label: "Title"
      }
      {
        key: "justification"
        label: "Justification"
      }
    ]
    group: "reviews"

Template.mealReviews.events
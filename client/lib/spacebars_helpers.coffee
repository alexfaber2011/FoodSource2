UI.registerHelper "isLoggedIn", () ->
  return Meteor.userId()

UI.registerHelper "showStars", (rating) ->
    if rating isnt 0
      i = 1
      output = ""
      while i <= rating
        output += "<i class='fa fa-star'>"
        i++
    else
      output = "Not Rated"
    return Spacebars.SafeString(output)

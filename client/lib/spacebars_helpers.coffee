UI.registerHelper "isLoggedIn", () ->
  return Meteor.userId()

UI.registerHelper "showStars", (rating) ->
    i = 1
    output = ""
    while i <= rating
      output += "<i class='fa fa-star'>"
      i++
    return Spacebars.SafeString(output)
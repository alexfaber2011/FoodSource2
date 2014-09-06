Accounts.onCreateUser (options, user) ->
  #Initializes the user's profile data
  user.profile =
    rating: 0
  return user
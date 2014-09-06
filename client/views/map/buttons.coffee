displayModal = ->
  modalInfo = undefined
  rd = undefined
  modalInfo =
    template: Template.createOfferedMeal
    title: "Offer a meal"

  rd = ReactiveModal.initDialog(modalInfo)
  rd.show()
  return

Template.buttons.events
  "click #createOfferedMeal": ->
    displayModal()

  "click #profile": ->
    userId = Meteor.userId()
    console.log userId
    if userId
      Router.go "/profile/#{userId}"

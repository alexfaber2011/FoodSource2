@Schemas = {}

Schemas.OfferedMeals = new SimpleSchema(
  _id:
    type: String
  userId:
    type: String
    autoValue: ->
      this.userId
  name:
    type: String
    label: "Name"
  lat:
    type: Number
  lng:
    type: Number
  description:
    type: String
    label: "Description"
  numOfServings:
    type: Number
    min: 0
    label: "Number of Servings"
  suggestedDonation:
    type: Number
    min: 0
    autoValue: ->
      accounting.unformat(this.field("suggestedDonationString"))
  suggestedDonationString:
    type: String
  address:
    type: String
  availableStart:
    type: String
    label: "Available From: "
  availableEnd:
    type: String
    label: "Available To: "
)
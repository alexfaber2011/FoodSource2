Template.indexRequestedMeals.RequestedMeals = function() {
	return RequestedMeals.find();
}

Meteor.subscribe('RequestedMeals');
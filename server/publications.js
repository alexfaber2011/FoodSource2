// Publish everything, cause who gives a shit

Meteor.publish('OfferedMeals', function() {
	return OfferedMeals.find();
});

Meteor.publish('RequestedMeals', function() {
	return RequestedMeals.find();
});
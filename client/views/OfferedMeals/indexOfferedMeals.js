Template.indexOfferedMeals.OfferedMeals = function () {
	return OfferedMeals.find();
}

Meteor.subscribe('OfferedMeals');
Template.createRequestedMeal.events = {
	'click input.add': function () {
		var foodName = document.getElementById("foodName").value;
		RequestedMeals.insert({name: foodName });
	}
};
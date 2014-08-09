// Template.createOfferedMeal.events = {
// 	'click input.btn': function () {
// 		var foodName = document.getElementById("foodName").value;
// 		OfferedMeals.insert({ name: foodName });
// 	}
// };

Template.createOfferedMeal.events({
	'submit form': function(event) {
		event.preventDefault();
		
		var food = { name: $(event.target).find('[name=foodName]').val() }
		
		Meteor.call('POST', food, function(error, id) {
			if (error)
				return alert(error.reason);
			
			Router.go('/');
		});
	}
});
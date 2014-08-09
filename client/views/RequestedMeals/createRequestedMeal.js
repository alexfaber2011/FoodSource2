Template.createRequestedMeal.events({
	'submit form': function(event) {
		event.preventDefault();
		
		var food = { name: $(event.target).find('[id=foodName]').val() }

		RequestedMeals.insert(food);
		
	}
});
Template.createOfferedMeal.events({
	'submit form': function(event) {
		event.preventDefault();
		
		var food = { name: $(event.target).find('[id=foodName]').val() }

		OfferedMeals.insert(food);
	}
});
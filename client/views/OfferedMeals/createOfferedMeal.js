Template.createOfferedMeal.events({
	'submit form': function(event) {
		event.preventDefault();

        //#TODO: convert this to autoform; add validation
		var food = {
            name: $(event.target).find('[id=foodName]').val(),
            lat: $(event.target).find('[id=lat]').val(),
            lng: $(event.target).find('[id=lng]').val()
        }

		OfferedMeals.insert(food);
	}
});
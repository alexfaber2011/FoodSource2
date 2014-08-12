Template.createOfferedMeal.events({
	'submit form': function(event) {
		event.preventDefault();

        //#TODO: convert this to autoform; add validation
		var food = {
            name: $(event.target).find('[id=foodName]').val(),
            lat: accounting.toFixed($(event.target).find('[id=lat]').val(), 2),
            lng: accounting.toFixed($(event.target).find('[id=lng]').val(), 2)
        }

		OfferedMeals.insert(food);
	}
});
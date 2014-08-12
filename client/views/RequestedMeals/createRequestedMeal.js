Template.createRequestedMeal.events({
	'submit form': function(event) {
		event.preventDefault();
		
		var address = $(event.target).find('[id=streetAddress]').val() + " " 
									+ $(event.target).find('[id=city]').val() + " "
									+ $(event.target).find('[id=state]').val() + " "
									+ $(event.target).find('[id=zip]').val();
		
		HTTP.get('https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyCbB-_YPraSIeF3_J4dcKahG77KLdY5G64&address=' + 
			address, function(error, geocoded) {
				if(error) {
					throw new Meteor.Error(500);
				}
				else {
					var lat = geocoded.results[0].geometry.location.lat;
					var lng = geocoded.results[0].geometry.location.lng;
					var food = { name: $(event.target).find('[id=foodName]').val(), lat: lat, lng: lng };
					RequestedMeals.insert(food);
				}
			});

	}
});
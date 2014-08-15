//Template.createOfferedMeal.events({
//	'submit form': function(event) {
//		event.preventDefault();
//
//        //#TODO: convert this to autoform; add validation
//		var address = $(event.target).find('[id=streetAddress]').val() + " "
//									+ $(event.target).find('[id=city]').val() + " "
//									+ $(event.target).find('[id=state]').val() + " "
//									+ $(event.target).find('[id=zip]').val();
//
//		HTTP.get('https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyCbB-_YPraSIeF3_J4dcKahG77KLdY5G64&address=' +
//			address, function(error, geocoded) {
//				if(error) {
//					throw new Meteor.Error(500);
//				}
//				else {
//					console.log(geocoded);
//					var lat = accounting.toFixed(geocoded.data.results[0].geometry.location.lat, 10);
//					var lng = accounting.toFixed(geocoded.data.results[0].geometry.location.lng, 10);
//					var food = { name: $(event.target).find('[id=foodName]').val(), lat: lat, lng: lng };
//					OfferedMeals.insert(food);
//				}
//			});
//	}
//});
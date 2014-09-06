Template.createOfferedMeal.helpers({
    'createOfferedMealError': function(){
        return Session.get("createOfferedMealError")
    },
    'createOfferedMealSuccess': function(){
        return Session.get("createOfferedMealSuccess")
    }
});

Template.createOfferedMeal.events({
	'submit form': function(event) {
		event.preventDefault();

        //#TODO: convert this to autoform; add validation
		var address = $(event.target).find('#streetAddress').val();

		HTTP.get('https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyCbB-_YPraSIeF3_J4dcKahG77KLdY5G64&address=' +
			address, function(error, geocoded) {
				if(error) {
					Session.set("createOfferedMealError", "Address is invalid");
                    Session.set("createOfferedMealSuccess", undefined);
                    throw new Meteor.Error(500);
				}
				else {
                    if(geocoded.data.results.length == 0){
                        Session.set("createOfferedMealError", "Address is invalid");
                        Session.set("createOfferedMealSuccess", undefined);
                    }
                    else{
                        Session.set("createOfferedMealError", undefined);
                        Session.set("createOfferedMealSuccess", "Meal Added Successfully");
                        setTimeout(function(){
                            Session.set("createOfferedMealSuccess", undefined);
                        }, 5000);
                        console.log(geocoded);
                        var lat = accounting.toFixed(geocoded.data.results[0].geometry.location.lat, 10);
                        var lng = accounting.toFixed(geocoded.data.results[0].geometry.location.lng, 10);
                        var user = Meteor.user();
                        var userName = user.username;
                        var food = {
                            name: $(event.target).find('#foodName').val(),
                            lat: lat,
                            lng: lng,
                            address: address,
                            userId: Meteor.userId(),
                            userName: userName,
                            description: $(event.target).find("#description").val(),
                            numOfServings: $(event.target).find("#numOfServings").val(),
                            rating: 0,
                            numOfVotes: 0,
                            available: true
                        };
//                        console.log(food);
                        OfferedMeals.insert(food);
                    }
				}
			});
	}
});
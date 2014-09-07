// Publish everything, cause who gives a shit

Meteor.publish('OfferedMeals', function() {
	return OfferedMeals.find();
});

Meteor.publish('RequestedMeals', function() {
	return RequestedMeals.find();
});

Meteor.publish('UserData', function() {
    return Meteor.users.find({}, {fields: {profile: 1, username: 1}});
});

Meteor.publish('Claims', function(){
   return Claims.find({});
});

Meteor.publish('Reviews', function(){
    return Reviews.find({});
});
// Add some random meals so the database has some shit
if (RequestedMeals.find().count() == 0) {
	RequestedMeals.insert({
		name: "Chicken Pot Pie"
	});
	
	RequestedMeals.insert({
		name: "Baby Nuts and Guts"
	});
	
	RequestedMeals.insert({
		name: "Baby Back Ribs"
	});
}

if (OfferedMeals.find().count() == 0) {
	OfferedMeals.insert({
		name: "Ice Cream"
	});
	
	OfferedMeals.insert({
		name: "Nuts"
	});
	
	OfferedMeals.insert({
		name: "Cheese"
	});
}
displayModal = function() {
	var modalInfo, rd;
	modalInfo = {
		template: Template.createOfferedMeal, 
		title: "Offer a meal", 
		buttons: {
			cancel: {
				"class": "btn-danger", 
				label: "Cancel"
			},
			ok: {
				closeOnModalClick: false, 
				"class": "btn-info", 
				label: "Create"
			}
		}
	};
	rd = ReactiveModal.initDialog(modalInfo);
	rd.show();
}

Template.buttons.events({
	
	"click #createOfferedMeal": function() {
		return displayModal();
	}
	
	// We don't want to request meals, cause thats stupid af
	// "click #createRequestedMeal": function() {
	// 	return displayModal("createRequestedMeal");
	// }
	
});

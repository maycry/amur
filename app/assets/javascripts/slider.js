jQuery(document).ready(function() {
	var right_controller = $('.slider-controller-right');
	var left_controller = $('.slider-controller-left');
	var wrapper = $('.slider-inner-wrapper');

	right_controller.click(function(){
		var pos = parseFloat(wrapper.css('margin-left'));
		if (pos > -1800) {
			wrapper.animate({'margin-left': '-=980px'}, 500);
		} else {
			wrapper.animate({'margin-left': '0'}, 500);
		};
		

	})
	left_controller.click(function(){
		var pos = parseFloat(wrapper.css('margin-left'));
		if (pos <= -980) {
			wrapper.animate({'margin-left': '+=980px'}, 500);
		};
	})
});

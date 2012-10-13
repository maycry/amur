jQuery(document).ready(function() {
	var right_controller = $('.slider-controller-right');
	var left_controller = $('.slider-controller-left');
	var wrapper = $('.slider-inner-wrapper');
	var slide_flag = true;

	right_controller.click(function(){
		if (slide_flag) {
			slide_flag =false;
			var pos = parseFloat(wrapper.css('margin-left'));
			if (pos > -1800) {
				wrapper.animate({'margin-left': '-=980px'}, 500);
			} else {
				wrapper.animate({'margin-left': '0'}, 500);
			};

			var active = $(".slider-viewer-center .active");
			if (active.next().is("span")){
				active.removeClass("active");
				active.next().addClass("active");
			} else {
				$(".slider-viewer-center span").first().addClass("active");
				active.removeClass("active");
			}

			setTimeout(function(){
				slide_flag=true;
			}, 500)
		};
		
	})
	left_controller.click(function(){
		if (slide_flag) {
			slide_flag =false;
			var pos = parseFloat(wrapper.css('margin-left'));
			if (pos <= -980) {
				wrapper.animate({'margin-left': '+=980px'}, 500);
			} else {
				wrapper.animate({'margin-left': '-1960px'}, 500);
			};
			var active = $(".slider-viewer-center .active");
			if (active.prev().is("span")){
				active.removeClass("active");
				active.prev().addClass("active");
			} else {
				$(".slider-viewer-center span").last().addClass("active");
				active.removeClass("active");
			}

			setTimeout(function(){
				slide_flag=true;
			}, 500)
		};
	})

	$(".slide-photo-controller a").click(function(e){
		var slide = $(this).closest(".slide");
		var new_name = slide.attr("data-name");
		var new_photo = slide.attr("data-style");

		slide.attr("data-name", $(this).html());
		slide.attr("data-style", slide.attr("style"));

		$(this).html(new_name);
		slide.attr("style", new_photo);
		return false;
	})
});

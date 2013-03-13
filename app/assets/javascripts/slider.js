jQuery(document).ready(function() {
	$(".slide-photo-controller a").click(function(e){
		event.preventDefault();
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

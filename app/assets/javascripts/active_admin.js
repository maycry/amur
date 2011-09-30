//= require active_admin/base

$(document).ready(function(){ 
	$("fieldset ol").each(function() {
    	if($(this).children().html()==null){
    		$(this).parent().css('display', 'none')
    	}
	});	
});

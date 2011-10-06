# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("#order_bust").focus ->
    $("#arrows").animate({backgroundPosition:"600px"}, 500)
  $("#order_waist").focus ->
    $("#arrows").animate({backgroundPosition:"0px"}, 500)
  $("#order_heaps").focus ->
    $("#arrows").animate({backgroundPosition:"400px"}, 500)
  $("#order_waisttofloor").focus ->
    $("#arrows").animate({backgroundPosition:"200px"}, 500)
  
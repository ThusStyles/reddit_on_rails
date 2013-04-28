# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$('.user-actions').hide()
	$('.user-links').hover(
		-> $(this).find('.user-actions').fadeIn(200)
		-> $(this).find('.user-actions').fadeOut(200)
		)
	
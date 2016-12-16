# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('document').ready ->
  if $("#user_password").parent().hasClass("field_with_errors")
    $("#user_password_confirmation").wrapAll('<div class="field_with_errors"></div>')

  if $("#user_password_confirmation").parent().hasClass("field_with_errors")
    $("#user_password").wrapAll('<div class="field_with_errors"></div>')
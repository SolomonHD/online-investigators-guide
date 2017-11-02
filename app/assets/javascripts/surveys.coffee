# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'click', '.field > .radio > .checkbox > :checkbox', (event) ->
  $(event.target).parent().parent().find('.checkbox > :checkbox').each (i, element) ->
    $(element).prop('checked', false)
  $(this).prop('checked', true)

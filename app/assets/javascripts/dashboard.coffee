# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('#runBrokenLinkReport').click ->
    alert ("Please do not refresh this page while the report is running. This could take a few minutes.")
    $("#linkReport").hide();
    $(".notification").hide();
    $("#loading").show();
    return
  return

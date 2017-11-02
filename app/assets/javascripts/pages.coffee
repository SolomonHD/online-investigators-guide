$(document).on 'turbolinks:load', ->
  $('.collection-check-box input[type=checkbox]').each ->
    if $(this).is(':checked')
      $(this).closest('.collection-check-box').addClass 'selected'
    return
  $('.collection-check-box input[type=checkbox]').change ->
    if $(this).prop('checked')
      $(this).closest('.collection-check-box').toggleClass 'selected'
      # alert("You have elected to show your checkout history."); //checked
    else
      $(this).closest('.collection-check-box').toggleClass 'selected'
      # alert("You have elected to turn off checkout history."); //not checked
    return
  return

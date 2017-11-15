$(document).on 'turbolinks:load', ->
  $('.collection-check-box input[type=checkbox]').each ->
    if $(this).is(':checked')
      $(this).closest('.collection-check-box').addClass 'selected'
    return
  $('.collection-check-box input[type=checkbox]').change ->
    if $(this).prop('checked')
      $(this).closest('.collection-check-box').toggleClass 'selected'
    else
      $(this).closest('.collection-check-box').toggleClass 'selected'
    return
  $('li.parent ul li.is-active').each ->
    $(this).closest('li.parent').addClass 'is-active-parent'
  return

$(document).on 'click', '.add-label-modal', ->
  $("#label_name").val ''
  $("#add-label").addClass 'is-active'
  return
  
$(document).on 'click', '.delete', ->
  $("#add-label").removeClass 'is-active'
  return

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

$(document).on 'turbolinks:load', ->
  # $(".page_body").each ->
  #   search = GetURLParameter('search')
  #   console.log(search)
  #   if $(this).attr('data-length') > 200
  #     startString = $(this).html().indexOf(search)
  #     shortString = jQuery.trim($(this).html()).substring(startString - 30)
  #     $(this).html(shortString)
  #     console.log($(this).html().indexOf(search))
  #     console.log($(this).attr('data-length'))
  #   else
  #     console.log('nope')
#     search = GetURLParameter('search')
#     console.log(search)
#     $(".search-results").children("li").each ->
#       $(this).html($(this).html().replace(search,"<span class='highlight'>#{search}</span>"));
#
#
GetURLParameter = (sParam) ->
  sPageURL = window.location.search.substring(1)
  sURLVariables = sPageURL.split('&')
  i = 0
  while i < sURLVariables.length
    sParameterName = sURLVariables[i].split('=')
    if sParameterName[0] == sParam
      return sParameterName[1]
    i++
  return

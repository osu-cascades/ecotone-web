$(document).on "turbolinks:load", ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('#lnk-show-soil-sample-fields').click ->
    $('#soil_sample_fields input').val('')
    $('#soil_sample_fields').collapse('toggle')
    if @.text == 'Add soil sample'
      $(@).text('Omit soil sample')
    else
      $(@).text('Add soil sample')
    false

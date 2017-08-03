$(document).on "turbolinks:load", ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).parent().prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide('fast')
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('#soil_sample_fields').on 'shown.bs.collapse', (event) ->
    $('#lnk-toggle-soil-sample-fields').text('Omit soil sample')

  $('#soil_sample_fields').on 'hidden.bs.collapse', (event) ->
    $(@).find(':input:not([type=hidden])').val('')
    $(@).find('#biodiversity_report_soil_sample_attributes__destroy').val('1')
    $('#lnk-toggle-soil-sample-fields').text('Add soil sample')

  $('#fungi_fields').on 'shown.bs.collapse', (event) ->
    $('#lnk-toggle-fungi-fields').text('Omit fungi sample')

  $('#fungi_fields').on 'hidden.bs.collapse', (event) ->
    $(@).find(':input:not([type=hidden])').val('')
    $(@).find('#biodiversity_report_fungi_sample_attributes__destroy').val('1')
    $('#lnk-toggle-fungi-fields').text('Add fungi sample')

  $('#lichen_fields').on 'shown.bs.collapse', (event) ->
    $('#lnk-toggle-lichen-fields').text('Omit lichen sample')

  $('#lichen_fields').on 'hidden.bs.collapse', (event) ->
    $(@).find(':input:not([type=hidden])').val('')
    $(@).find('#biodiversity_report_lichen_sample_attributes__destroy').val('1')
    $('#lnk-toggle-lichen-fields').text('Add lichen sample')

  $('#macroinvertebrate_fields').on 'shown.bs.collapse', (event) ->
    $('#lnk-toggle-macroinvertebrate-fields').text('Omit macroinvertebrate sample')

  $('#macroinvertebrate_fields').on 'hidden.bs.collapse', (event) ->
    $(@).find(':input:not([type=hidden])').val('')
    $(@).find('#biodiversity_report_macroinvertebrate_sample_attributes__destroy').val('1')
    $('#lnk-toggle-macroinvertebrate-fields').text('Add macroinvertebrate sample')

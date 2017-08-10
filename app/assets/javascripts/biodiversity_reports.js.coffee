$(document).on "turbolinks:load", ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).parent().next('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide('fast')
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).parent().before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('#soil_sample_fields').on 'shown.bs.collapse', (event) ->
    $('#lnk-toggle-soil-sample-fields').text('Omit soil sample')

  $('#soil_sample_fields').on 'hidden.bs.collapse', (event) ->
    $(@).find(':input:not([type=hidden])').val('')
    $(@).find('#biodiversity_report_soil_sample_attributes__destroy').val('1')
    $('#lnk-toggle-soil-sample-fields').text('Add soil sample')

  $('#fungi_sample_fields').on 'shown.bs.collapse', (event) ->
    $('#lnk-toggle-fungi-sample-fields').text('Omit fungi sample')

  $('#fungi_sample_fields').on 'hidden.bs.collapse', (event) ->
    $(@).find(':input:not([type=hidden])').val('')
    $(@).find('#biodiversity_report_fungi_sample_attributes__destroy').val('1')
    $('#lnk-toggle-fungi-sample-fields').text('Add fungi sample')

  $('#lichen_sample_fields').on 'shown.bs.collapse', (event) ->
    $('#lnk-toggle-lichen-sample-fields').text('Omit lichen sample')

  $('#lichen_sample_fields').on 'hidden.bs.collapse', (event) ->
    $(@).find(':input:not([type=hidden])').val('')
    $(@).find('#biodiversity_report_lichen_sample_attributes__destroy').val('1')
    $('#lnk-toggle-lichen-sample-fields').text('Add lichen sample')

  $('#macroinvertebrate_sample_fields').on 'shown.bs.collapse', (event) ->
    $('#lnk-toggle-macroinvertebrate-sample-fields').text('Omit macroinvertebrate sample')

  $('#macroinvertebrate_sample_fields').on 'hidden.bs.collapse', (event) ->
    $(@).find(':input:not([type=hidden])').val('')
    $(@).find('#biodiversity_report_macroinvertebrate_sample_attributes__destroy').val('1')
    $('#lnk-toggle-macroinvertebrate-sample-fields').text('Add macroinvertebrate sample')

  $('#nonvascular_plant_sample_fields').on 'shown.bs.collapse', (event) ->
    $('#lnk-toggle-nonvascular-plant-sample-fields').text('Omit non-vascular plant sample')

  $('#nonvascular_plant_sample_fields').on 'hidden.bs.collapse', (event) ->
    $(@).find(':input:not([type=hidden])').val('')
    $(@).find('#biodiversity_report_nonvascular_plant_sample_attributes__destroy').val('1')
    $('#lnk-toggle-nonvascular-plant-sample-fields').text('Add non-vascular plant sample')

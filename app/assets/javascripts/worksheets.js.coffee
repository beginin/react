# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#worksheet_language_name').autocomplete
    source: $('#worksheet_language_name').data('autocompete-source')
    delay: 100

  $('#worksheet_specialty_name').autocomplete
    source: $('#worksheet_specialty_name').data('autocompete-source')
    delay: 100

  $('#worksheet_city_name').autocomplete
    source: $('#worksheet_city_name').data('autocompete-source')
    delay: 100

 # $("[id*='_stimul_name']").autocomplete
 #   source: $("[id*='_stimul_name']").data('autocompete-source')
 #   delay: 100

  $("[id*='_reaction_name']").autocomplete
    source: $("[id*='_reaction_name']").data('autocompete-source')
    delay: 50


  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#worksheet_language_name').autocomplete
    source: $('#worksheet_language_name').data('autocompete-source')

jQuery ->
  $('#worksheet_specialty_name').autocomplete
    source: $('#worksheet_specialty_name').data('autocompete-source')

jQuery ->
  $('#worksheet_city_name').autocomplete
    source: $('#worksheet_city_name').data('autocompete-source')

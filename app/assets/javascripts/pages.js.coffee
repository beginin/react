jQuery ->
  $('#query').autocomplete
    source: $('#query').data('autocompete-source')
    delay: 100 
  

jQuery ->
  $('#stimulreaction_stimul').change -> 
  	$('#query').data('autocompete-source', '/stimuls/searchwithoutnumber')
  	$('#query').autocomplete
    	source: $('#query').data('autocompete-source')


jQuery ->
  $('#stimulreaction_reaction').change -> 
  	$('#query').data('autocompete-source', '/reactions/search')
  	$('#query').autocomplete
    	source: $('#query').data('autocompete-source')

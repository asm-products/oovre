$(document).ready -> 
	
	editor = new MediumEditor('.content-editor',
		anchorInputPlaceholder: "Type or past a link"
		buttons: [
			"bold",
			"italic",
			"quote",
			"header1",
			"header2",
			"unorderedlist",
			"orderedlist",
			"anchor"
		]
	)


	$('.content-editor').on 'input', ->
		$('.content-editor-content').val $(this).html()

	$('#new_article').on('ajax:success', (e, data, status, xhr) ->
		if data.status != "success"
			alert data.message
	).on 'ajax:error', (e, xhr, status, error) ->
		alert "Oops. Something went wrong..."
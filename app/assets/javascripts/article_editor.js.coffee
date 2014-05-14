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
			$('#articleCreator').stop().fadeOut 100
			$('#overlay').stop().fadeOut 100
			window.location.href = data.location
	).on 'ajax:error', (e, xhr, status, error) ->
		alert "Oops. Something went wrong..."

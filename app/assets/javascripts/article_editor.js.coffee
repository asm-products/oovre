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
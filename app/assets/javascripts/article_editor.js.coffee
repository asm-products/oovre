$(document).ready -> 
	
	editor = new MediumEditor('.content-editor')
	$('.content-editor').on 'input', ->
		$('.content-editor-content').val $(this).html()
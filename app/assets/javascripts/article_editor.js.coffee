$(document).ready -> 
	
	# editor = $('#content-editor')

	# saveData = (e) ->
	# 	# this should save the article. AutoSave pretty much.
	# 	console.log "saved contents"

	# wrapAsLink = (url) ->
	# 	range = window.getSelection().getRangeAt(0)
	# 	replace = "<a href='#{url}'>#{range}</a>"
	# 	update_editor editor.html

	# update_editor = (content) ->
	# 	editor.html = content
	# 	saveData

	# init = ->
	# 	editor.attr('contenteditable','true')
	# 	editor.html("<p>Write some text here.</p>")
	# 	console.log "initialized editor..."

	# init()
	# $('#add_link').click ->
	# 	wrapAsLink('http://google.com')

	$('#content-editor')
	    .notebook()
	    .on 'contentChange', (e) ->
	      $('.content-editor-content').val e.originalEvent.detail.content
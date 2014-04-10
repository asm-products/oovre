$ -> 

	$('#content-editor')
    .notebook()
    .on 'contentChange', (e) ->
      $('.content-editor-content').val e.originalEvent.detail.content
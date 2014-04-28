$ ->

	$('#new_article_btn').on 'click', ->
		$('#articleCreator').stop().fadeIn 200
		$('#overlay').stop().fadeIn 200

	$('#triggerArticleClose').click ->
		$('#articleCreator').stop().fadeOut 100
		$('#overlay').stop().fadeOut 100

	$('[id^=alert-]').on 'click', ->
		$(this).fadeOut 'fast'
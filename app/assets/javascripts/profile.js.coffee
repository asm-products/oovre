$ ->

  $('#follow-user').click ->
    $.post '/api/users/follow',
      user_id: $(this).data 'user-id'
      (data) -> 
        $('.follow-group')
          .addClass 'is-following'
          .removeClass 'not-following'

  $('#unfollow-user').click ->
    $.post '/api/users/unfollow',
      user_id: $(this).data 'user-id'
      (data) ->
        $('.follow-group')
          .removeClass 'is-following'
          .addClass 'not-following'
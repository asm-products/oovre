fetchFollowerCount = ->
  $.get '/api/users/follower_count',
    user_id: $('#user-information').data 'user-id'
    (data) ->
        $('#follower-count').html data.message.follower_count

$ ->

  $('#follow-user').click ->
    $.post '/api/users/follow',
      user_id: $(this).data 'user-id'
      (data) ->
        fetchFollowerCount()
        $('.follow-group')
          .addClass 'is-following'
          .removeClass 'not-following'

  $('#unfollow-user').click ->
    $.post '/api/users/unfollow',
      user_id: $(this).data 'user-id'
      (data) ->
        fetchFollowerCount()
        $('.follow-group')
          .removeClass 'is-following'
          .addClass 'not-following'
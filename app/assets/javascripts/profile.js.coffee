$ ->

  $('#follow-user').click ->
    $.post '/api/users/follow',
      user_id: $(this).data 'user-id'
      (data) -> $('#follow-user').html 'Following this user'

  $('#unfollow-user').click ->
    $.post '/api/users/unfollow',
      user_id: $(this).data 'user-id'
      (data) -> $("#following-user").html 'Unfollowed'

  $('.follow')
    .mouseover ->
      $('#unfollow-user').fadeIn 100
      $('#following-user').fadeOut 200
    .mouseout ->
      $('#unfollow-user').fadeOut 100
      $('#following-user').fadeIn 100

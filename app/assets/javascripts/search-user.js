$(function(){
  function buildHTML(user){
    console.log(user.email)
    var html = {}
    var list = '<div class="chat-group-user clearfix" data-user-id='
    + user.id
    + '></div>'
    if(user.avatar.url) {
      html.user_avatar = '<img src="' + user.avatar.url + '">'
    } else {
      html.user_avatar = '<img src="/assets/prof.jpg">'
    }
    if(user.nickname) {
      html.user_nickname = '<p class="chat-group-user__name">'
      + user.nickname
      + '</p>'
    } else {
      html.user_nickname = '<p class="chat-group-user__name">'
      + user.email.replace(/@.+/, "");
      + '</p>'
    }
    var appendList = $(list).append(html.user_avatar, html.user_nickname);
    $(".chat__modal-window__search-user__list").append(appendList);
  }

  $('.chat__modal-window__search-user__field').on('keyup', '.chat-group-form__input', function(e){
    e.preventDefault();
    var input = $.trim($(this).val());
    $.ajax({
      url: '/users/search',
      type: 'GET',
      data: ('keyword=' + input),
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data){
      $('.chat__modal-window__search-user__list').empty();
      $(data).each(function(i, user){
        buildHTML(user)
      });
    });
  });

  $('.chat__modal-window').on('click', '.chat-group-user', function(){
    var user_id = $(this).data('user-id');
    var user_name = $(this).text();
    $('.chat-group-user--checked').remove();
    $(this).remove();
    $('.chat__modal-window__search-user__result').append('<input type=hidden name="group[talker_ids][]" class="chat-group-user--checked" value=' + user_id + '></input>');
    $('.chat__modal-window__search-user__partner').empty();
    $('.chat__modal-window__search-user__partner').append('<span class="chat-partner">' + user_name + '</span>');
    $('.send-btn').remove();
    $('.chat__modal-window__search-user__result').append('<input type="submit" name="commit" value="次へ" class="send-btn">');
  });
  $('.back').click(function(){
    $(".chat__modal-window").load("/groups");
  });
});

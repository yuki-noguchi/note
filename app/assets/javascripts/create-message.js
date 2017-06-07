$(function(){
  function buildMessage(message){
    var html = {}
    var list = '<li class="message" data-id=' + message.id + '></li>'
    html.avatar = '<div class="message__avatar">' + message.avatar + '</div>'
    html.nickname = '<div class="message__nickname">' + message.nickname + '</div>'
    html.created_at = '<div class="message__time">' + message.created_at + '</div>'
    html.body = '<div class="message__body">' + message.body + '</div>'
    var appendList = $(list).append(html.avatar, html.nickname, html.created_at, html.body);
    if(message.body){
      $('.chat__modal-window__main__contents').append(appendList[0]);
    }
  }
  $('.chat-form').submit(function(e){
    e.preventDefault();
    var input = $(this);
    $.ajax({
      url: input.attr('action'),
      type: input.attr('method'),
      data: input.serialize(),
      dataType: 'json'
    })
    .done(function(data){
      buildMessage(data);
      $('.chat-body').val('');
      $('.chat-submit').prop('disabled', false);
      $('.chat__modal-window__main').animate({
        scrollTop: $('.message:last').offset().top
      });
    })
    .fail(function(){
      alert('エラーが発生しました');
    })
  });

  $('.chat__modal-window').ready(function(){
    setInterval(update, 3000);
  });
  function update(){
    var group_id = $('.chat__modal-window__main').data('id');
    if($('.message')[0]) {
      var message_id = $('.message:last').data('id');
    } else {
      var message_id = 0
    }
    $.ajax({
      url: '/groups/' + group_id + '/messages',
      type: 'GET',
      data: {
        message: { id: message_id}
      },
      dataType: 'json'
    })
    .always(function(data){
      $.each(data, function(i, data){
        buildMessage(data);
      })
    })
  }
});

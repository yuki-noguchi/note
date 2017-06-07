$(function(){
  function centeringModalSyncer(){
    var w = $(window).width();
    var h = $(window).height();
    var cw = $(".chat__modal-window").outerWidth(true);
    var ch = $(".chat__modal-window").outerHeight(true);
    var pxleft = ((w - cw)/2);
    var pxtop = ((h - ch)/2);
    $(".chat__modal-window").fadeIn('slow');
    $(".chat__modal-window, .chat__modal-window__main__form").css({"left": pxleft + "px"});
    $(".chat__modal-window, .chat__modal-window__main__form").css({"top": pxtop + "px"});
  }

  $('.chat-button').click(function(){
    $(this).blur();
    if($('.modal-overlay')[0]) return false;
    $('body').append('<div class="modal-overlay"></div>');
    $('.modal-overlay').fadeIn('slow');
    centeringModalSyncer();
    $('.chat__modal-window').load("/groups")
  });

  $("body").on("click", ".modal-overlay, .chat-modal-close", function(){
    $(".modal-overlay").remove();
    $(".chat__modal-window").hide();
  });

  $('.chat-start').click(function(){
    $('.chat__modal-window').load("/groups/new");
  });

  $('.chat__modal-window__groups').click(function() {
    var group_id = $(this).data('id');
    $('.chat__modal-window').load('/groups/' + group_id + '/messages');
  })
});

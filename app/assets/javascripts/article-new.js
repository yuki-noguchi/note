$(function(){
  function centeringModalSyncer(){
    var w = $(window).width();
    var h = $(window).height();
    var cw = $(".modal-window").outerWidth(true);
    var ch = $(".modal-window").outerHeight(true);
    var pxleft = ((w - cw)/2);
    var pxtop = ((h - ch)/2);
    $(".modal-window").fadeIn('slow');
    $(".modal-window").css({"left": pxleft + "px"});
    $(".modal-window").css({"top": pxtop + "px"});
  }

  $('.create-note__header__post').click(function(){
    $(this).blur();
    if($('.modal-overlay')[0]) return false;
    var bodyLength = $('.create-note__main__body').val().length;
    $('.body-length').text('全体の文字数：' + bodyLength + '文字');
    $('body').append('<div class="modal-overlay"></div>');
    $('.modal-overlay').fadeIn('slow');
    centeringModalSyncer();
  });

  $("body").on("click", ".modal-overlay, .modal-close", function(){
    $(".modal-overlay").remove();
    $(".modal-window").hide();
  });
  $('.free_or_paid').click(function(){
    var check = $('input[name="price"]:checked').val();
    if(check === 'free'){
      $('.modal-window__price__field').hide();
      $('.modal-window__body-limit').hide();
    } else {
      $('.modal-window__price__field').show();
      $('.modal-window__body-limit').show();
    }
  });
});

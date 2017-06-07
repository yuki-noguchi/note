$(function(){
  function centeringModalSyncer(){
    var w = $(window).width();
    var h = $(window).height();
    var cw = $(".article__modal-window").outerWidth(true);
    var ch = $(".article__modal-window").outerHeight(true);
    var pxleft = ((w - cw)/2);
    var pxtop = ((h - ch)/2);
    $(".article__modal-window").fadeIn('slow');
    $(".article__modal-window").css({"left": pxleft + "px"});
    $(".article__modal-window").css({"top": pxtop + "px"});
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
    $(".article__modal-window").hide();
  });
  $('.free_or_paid').click(function(){
    var check = $('input[name="price"]:checked').val();
    if(check === 'free'){
      $('.article__modal-window__price__field').hide();
      $('.article__modal-window__body-limit').hide();
    } else {
      $('.article__modal-window__price__field').show();
      $('.article__modal-window__body-limit').show();
    }
  });
});

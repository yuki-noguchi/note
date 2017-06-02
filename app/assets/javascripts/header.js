$(function(){
  $('.top-menu__user').on('click', 'img', function(){
    $(this).blur();
    if($('.header-hidden-overlay')[0]) return false;
    $('body').append('<div class="header-hidden-overlay"></div>');
    $('.arrow').show();
    $('.hidden-menu').show();
  });

  $('body').on('click', '.header-hidden-overlay', function(){
      $('.arrow').hide();
      $('.hidden-menu').hide();
      $('.header-hidden-overlay').remove();
  });
});

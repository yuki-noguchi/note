$('.new_group').submit(function(e){
  e.preventDefault();
  var ids = $(':hidden[name="group[talker_ids][]"]').map(function(){
    return $(this).val();
  }).get();
  $.ajax({
    url: '/groups',
    type: 'POST',
    data: {
      group: { talker_ids: ids }
    },
    dataType: 'json'
  })
  .done(function(data){
    $('.chat__modal-window').load('/groups/' + data.id + '/messages');
  })
  .fail(function(data){
    alert('NO')
  })
});

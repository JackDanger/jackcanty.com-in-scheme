$(function(){
  $.ajax({
    url: 'http://jackcanty.com/twitter.xml',
    type: 'GET',
    dataType: 'xml',
    timeout: 1000,
    error: function(error){
      $('status').text = 'currently: developing software'
    },
    success: function(xml){
      twitters = $(xml).find('entry');
      var after_first = false;
      twitters.each(function(){
        if(after_first){
          $('#status').text($(this).find('title').text());
        }else{
          $('#status').text($(this).find('title').text());
          after_first = true;
        }
      });
    }
  })
})

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
	
        }else{
          $('#status').text($(this).find('title').text().replace(/^jackdanger: /, ''));
          after_first = true;
        }
      });
    }
  })
})

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
      var i = 0;
      twitters.each(function(){
        text = $(this).find('title').text().replace(/^jackdanger: /, '')
        if(0 == i)
          $('#status').text(text);
	else if(19 == i)
	  $('#twitters').append('<div class="alt last">'+text+'</div>');
        else
	  $('#twitters').append('<div class="alt">'+text+'</div><hr class="small" />');
	i++;
      });
    }
  })
})

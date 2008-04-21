$(function(){
  $.ajax({
    url: 'http:///twitter.com/statuses/user_timeline/3496901.rss',
    type: 'GET',
    dataType: 'xml',
    timeout: 1000,
    error: function(){
      alert('couldn\'t retrieve status')
    },
    success: function(xml){
      $(xml).find('entry').each(function(){
        var status_text = $(this).title().gsub(/$jackdanger: /, '')
	$('#status').text = status_text;
      });
    }
  })
})

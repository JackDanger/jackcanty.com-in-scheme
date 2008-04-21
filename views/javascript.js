$(function(){
  $.ajax({
    url: 'http://jackcanty.com/twitter.xml',
    type: 'GET',
    dataType: 'xml',
    timeout: 1000,
    error: function(error){
    },
    success: function(xml){
      $(xml).find('entry').each(function(){
        var status_text = $(this).title().gsub(/$jackdanger: /, '')
	$('#status').text = status_text;
      });
    }
  })
})

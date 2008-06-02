$.ajax({
  url: '/twitter.xml',
  type: 'GET',
  dataType: 'xml',
  timeout: 1000,
  error: function(error){
    $('status').text = 'currently: developing software'
  },
  success: function(xml){
    twitters = $(xml).find('title');
    var i = 0;
    twitters.each(function(){
      text = $(this).text().replace(/^jackdanger: /, '')
      if(0 == i)
        $('#twitters').append($('<h3></h3>').append('<a href="http://twitter.com/jackdanger/">'+text+'</a>'))
      else if(1 == i)
        $('#status').text(text);
      else if(19 == i)
        $('#twitters').append('<div class="alt last">'+text+'</div>');
      else
        $('#twitters').append('<div class="alt">'+text+'</div><hr class="small" />');
      i++;
    });
  }
})

$.ajax({
  url: '/dailyoffice.xml',
  type: 'GET',
  dataType: 'xml',
  timeout: 1000,
  error: function(error){
    if(console){console.log(error)}
  },
  success: function(xml){
    photos = $(xml).find('item');
    var i = 0;
    $('#photos').append('<div class="container"></div>');
    photos.each(function(){
      if(i % 5 == 0 && i != 0)
        $('#photos').append($('<div class="container"></div>'));
      link = $(this).find('link:first').text()
      src = $(this).find("thumbnail").attr("url")
      $('#photos .container:last').append($('<div class="span-3"></div>').append($('<a href="'+link+'" title=""></a>').append($('<p></p>').append('<img src="'+src+'" />'))));
      i++;
    });
  }
})

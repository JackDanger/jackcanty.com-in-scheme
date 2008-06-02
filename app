#!/usr/bin/ruby
require 'config'
require 'resources'

get '/' do
  haml :index
end

get '/stylesheet.css' do
  header 'Content-Type' => 'text/css; charset=utf-8'
  sass :stylesheet
end

get '/jquery.js' do
  send_file Sinatra.application.options.views + '/jquery.lite.js', :disposition => 'inline'
end

get '/javascript.js' do
  send_file Sinatra.application.options.views + '/javascript.js', :disposition => 'inline'
end

resource '/twitter.xml',     'http://twitter.com/statuses/user_timeline/3496901.atom'
resource '/dailyoffice.xml', 'http://api.flickr.com/services/feeds/photos_public.gne?id=30691816&lang=en-us&format=rss_200'

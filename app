#!/usr/bin/ruby
require File.join(File.dirname(__FILE__), 'config.rb')

get '/' do
  haml :index
end

resources '/twitter.xml' => 'http://twitter.com/statuses/user_timeline/3496901.atom',
          '/dailyoffice.xml'  => 'http://api.flickr.com/services/feeds/photoset.gne?set\x3d72157600518706193\x26nsid\x3d30691816@N00\x26lang\x3den-us'

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


#!/usr/bin/ruby
require 'rubygems'
require 'sinatra'
require 'net/http'

get '/' do
  haml :index
end

get '/twitter.xml' do
  send_data Net::HTTP.get(URI.parse('http://twitter.com/statuses/user_timeline/3496901.atom')), :type => 'application/xml'
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

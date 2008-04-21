#!/usr/bin/ruby
require 'rubygems'
require 'sinatra'

get '/' do
  haml :index
end

get '/stylesheet.css' do
  header 'Content-Type' => 'text/css; charset=utf-8'
  sass :stylesheet
end

get '/jquery.js' do
  send_file Sinatra.application.options.views + '/jquery.lite.js'
end

get '/javascript.js' do
  send_file Sinatra.application.options.views + '/javascript.js'
end

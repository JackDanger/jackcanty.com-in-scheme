require 'rubygems'
require 'sinatra'
require 'net/http'


def resources(names = {})
  names.each do |local, remote|
    get local do
      send_data Net::HTTP.get(URI.parse(remote)), :type => 'application/xml'
    end
  end
end

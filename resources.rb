require 'net/http'

def resource(local, remote)
  get local do
    uri = URI.parse(remote)
    (1..5).each do |n|
      @resource_body = Net::HTTP.get uri
      break unless '' == @resource_body.strip
    end
    send_data @resource_body, :type => 'application/xml'
  end
end

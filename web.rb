require 'sinatra'

require 'ipaddr'
require 'httpclient'

CLOUDFLARE_EMAIL = ENV["X-Auth-Email"]
CLOUDFLARE_AUTH = ENV["X-Auth-Key"]

raise "Invalid Credentials" unless CLOUDFLARE_AUTH.to_s.length > 0 && CLOUDFLARE_EMAIL.to_s.length > 0

CLOUDFLARE_ZONE = ENV["CLOUDFLARE_ZONE"]
CLOUDFLARE_RECORD = ENV["CLOUDFLARE_RECORD"]

raise "Requires non-empty zone & record" unless CLOUDFLARE_ZONE.to_s.length > 0 && CLOUDFLARE_RECORD.to_s.length > 0

get '/' do
    local_auth = params["api-key"]
    halt 403, "Invalid api-key" unless local_auth == "foo"
    
    client_ip = IPAddr.new(request.ip)
    halt 400, "Must be IPv4 request address" unless client_ip.ipv4?
    
    HTTPClient.new.request("PATCH",
      "https://api.cloudflare.com/client/v4/zones/#{CLOUDFLARE_ZONE}/dns_records/#{CLOUDFLARE_RECORD}",
      :body => "{ \"content\": \"#{client_ip.to_s}\" }"
      ).body
end

require 'sinatra'

CLOUDFLARE_EMAIL = ENV["X-Auth-Email"]
CLOUDFLARE_AUTH = ENV["X-Auth-Key"]

raise "Invalid Credentials" unless CLOUDFLARE_AUTH.to_s.length > 0 && CLOUDFLARE_EMAIL.to_s.length > 0

get '/' do
    local_auth = params["api-key"]
    raise "Invalid api-key" unless local_auth == "foo"
    
    
    
    "Successful"
end

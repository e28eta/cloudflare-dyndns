Really basic sinatra web-app that reads the client ip, and as long as the api-key parameter
matches the expected value, it fires off a request to update a cloudflare DNS record with
that client ip address.

heroku config must contain these env variables: CLOUDFLARE_RECORD, CLOUDFLARE_ZONE, X-Auth-Email, X-Auth-Key

TODO: before sharing this with the public, extract out the api-key too.

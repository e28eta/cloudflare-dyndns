Really basic sinatra web-app that reads the client ip, and as long as the api-key parameter
matches the expected value, it fires off a request to update a cloudflare DNS record with
that client ip address.

This has been working really well for me with the DD-WRT Custom DDNS Service setup & heroku. It probably
breaks terribly if there's a proxy between the router and the web service.

heroku config must contain these env variables:

* `CLOUDFLARE_ZONE`, `CLOUDFLARE_RECORD`: The zone and record to update
* `X-Auth-Email`, `X-Auth-Key`: The Cloudflare authentication credentials
* `LOCAL_API_KEY`: A locally defined secret that incoming requests must contain in order to trigger a DNS update.

Here's an example of the DD-WRT setup:

![DDNS Setup with url format](screenshot.png?raw=true)

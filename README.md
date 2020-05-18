# Frameio Ruby SDK

The Frameio Ruby SDK is a small useful client and OAuth2 library for integrating with [frameio.io](https://frame.io)

This has been built on top of [HTTParty](https://github.com/jnunemaker/httparty)

## Installation

Use bundler to install the Frameio Ruby SDK.

```bash
gem install frameio
```

## Usage

```ruby
require "frameio" #<-- require the package
# The configuration block is very imoportant!
# These four values are required for the 0Auth2 process
# The client simply need the token auth token provided from frameio

Frameio.configure do |c|
  c.client_id = "cool_client_od"
  c.client_secret = "fun_secret"
  c.auth_redirect_uri = "http://localhost:5000/frameio/callback"
  c.scope = "offline account.read team.read project.read asset.read asset.create"
end

auth = Frameio::Auth.new #<-- create a new instance of teh auth class
auth.create_auth_url # <-- this is the url the client will access to start the OAuth2 flow

token = auth.create_auth_token(auth_code: auth_code).parsed_response # <-- the code that is returned in the url params after a successful OAuth2 redirect

client = Frameio::Client.new(token: token) #<-- pass the response token to a new client instance
response = client.get("/me") #<--- make your request!
```

## HTTParty

All the requests are wrapped in HTTParty response objects, and to access the response just call the `.parsed_response` method on the returned object.

## Configuration

### IMPORTANT!

These values can be found on your frame.io developer account page.

All 4 values are needed for the authentication process to work.

```ruby
Frameio.configure do |c|
  c.client_id = "cool_client_od"
  c.client_secret = "fun_secret"
  c.auth_redirect_uri = "http://localhost:5000/frameio/callback"
  c.scope = "offline account.read team.read project.read asset.read asset.create"
end

```

## Auth Methods

```ruby
auth = Frameio::Auth.new #<-- create a new instance of teh auth class

# create_auth_url uses the values provided by the configuration step to supply
# you with a formatted auth url where the OAuth2 authentication step beings
auth.create_auth_url(state: "any_state_wany")

# create_auth_token takes an auth_code param that comes from completing the OAuth2 process
# It makes a request to the auth endpoint of frame.io's api and returns you a valid auth token
token_to_store = auth.create_auth_token(auth_code: "code_from_frameio_redirect_url")

# refresh_auth_token takes an old auth token provided by frame.io and makes the request for
# a new token. This method should be used after a token has expired.
refreshed_token = auth.refresh_auth_token(token)
```

## Client Methods

```ruby
# The token is the secret to accessing the resources so don't forget it :)
client = Frameio::Client.new(token: frameio_auth_token) #<-- create a new instance of the frame.io client

# get method does exactly what it says it does. It goes and gets information from an authenticated frame.io endpoint
# the only parameter needed is the path to the resource you want to get.
client.get("/me")
client.get("/account/#{account_id}/teams")

# create method takes 2 params. The first being the endpoint you want to hit, and the second in the body.
# NOTE: We use ruby keyword arguments!
client.create("/assets/#{asset_id}/comments", body: { frameio: "Formatted Comment" })

# update method takes 2 params. The first being the endpoint you want to hit, and the second in the body.
client.update("/comments/#{comment_id}", body: { frameio: "Formatted Comment" })

# delete method will delete a resource from Frame.io for you.
client.delete("/comments/#{comment_id}")


```

## Convenience Methods

```ruby

client.to_query_string({ foo:bar }) #<-- turns object in to query strings! YAY!


# The to_ostruct method will recursively turn any hash into an OpenStruct.
# I like it, but they are your responses so do what you want to with them :)

response = client.get("/me")
client.to_ostruct(response.parsed_response)

```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)

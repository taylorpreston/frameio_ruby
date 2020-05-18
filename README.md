# Frameio Ruby SDK

The Frameio Ruby SDK is a small useful client and OAuth2 library for integrating with [frameio.io](https://frame.io)

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

token = auth.create_auth_token(auth_code: auth_code) # <-- the code that is returned in the url params after a successful OAuth2 redirect

client = Frameio::Client.new(token: token) #<-- pass the response token to a new client instance
response = client.get("/me") #<--- make your request!
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)

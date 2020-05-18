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

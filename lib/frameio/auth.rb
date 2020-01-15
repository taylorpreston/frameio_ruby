module Frameio
  class Auth
    include HTTParty
    base_uri 'https://applications.frame.io'
    debug_output $stdout
    headers "Content-Type" => "application/x-www-form-urlencoded"
    format :json
    
    def self.create_auth_token(auth_code:, redirect_uri:)
      body = {
        code: auth_code,
        grant_type: "authorization_code",
        redirect_uri: redirect_uri,
      }
      request(body)
    end

    def self.refresh_auth_token(frameio_token:)
      body = {
        grant_type: "refresh_token",
        refresh_token: frameio_token.refresh_token
      }
      request(body)
    end

    def self.encoded_secret
      client_id = Frameio.configuration.client_id
      client_secret = Frameio.configuration.client_secret
      Base64.strict_encode64("#{client_id}:#{client_secret}")
    end

    def self.request(body)
      HTTParty.send(
        :post,
        "/oauth2/token",
        { Authorization: "Basic #{encoded_secret}" },
        body: body,
      )
    end
  end
end
module Frameio
  class Auth
    include HTTParty
    format :json

    AUTH_URL = "https://applications.frame.io/oauth2/auth".freeze

    def initialize
    end

    def create_auth_url(state: "default_state")
      uri = Addressable::URI.new
      uri.query_values = {
        response_type: 'code',
        redirect_uri: Frameio.configuration.auth_redirect_uri,
        client_id: Frameio.configuration.client_id,
        scope: Frameio.configuration.scope,
        state: state
      }
      "#{AUTH_URL}?#{uri.query}"
    end
    
    def create_auth_token(auth_code:)
      body = {
        code: auth_code,
        grant_type: "authorization_code",
        redirect_uri: Frameio.configuration.auth_redirect_uri,
      }
      request(body)
    end

    def refresh_auth_token(frameio_token:)
      body = {
        grant_type: "refresh_token",
        refresh_token: frameio_token.refresh_token
      }
      request(body)
    end

    private

    def encoded_secret
      client_id = Frameio.configuration.client_id
      client_secret = Frameio.configuration.client_secret
      Base64.strict_encode64("#{client_id}:#{client_secret}")
    end

    def request(body)
      HTTParty.send(
        :post,
        "https://applications.frame.io/oauth2/token",
        headers: { Authorization: "Basic #{encoded_secret}" },
        body: body,
      )
    end
  end
end
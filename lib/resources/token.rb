module Frameio
  class Token < APIResource
    # @param auht_code [String] Auth code that comes from the frame auth endpoint.
    def self.create(auth_code:)
      body = { 
        code: auth_code,
        grant_type: "authorization_code",
        redirect_uri: REDIRECT_URI,
      }
      request(:post, self.resource_url, authorize_basic_auth_header, body)
    end
    
    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    def self.refresh(frameio_token:)
      body = {
        grant_type: "refresh_token",
        refresh_token: frameio_token.refresh_token
      }
      request(:post, self.resource_url, authorize_basic_auth_header, body)
    end

    def self.resource_url
      "https://applications.frame.io/oauth2/token"
    end 
  end
end
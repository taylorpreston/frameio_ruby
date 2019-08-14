module Frameio
  class Me < APIResource
    
    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    def self.list(frameio_token:)
      request(:get, resource_url, authorize_bearer_header(frameio_token))
    end

    def self.resource_url
      "#{BASE_URL}/me"
    end
  end
end
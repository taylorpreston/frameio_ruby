module Frameio
  class Me < APIResource
    
    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    def self.list(frameio_token:)
      request(:get, "#{BASE_URL}/me", authorize_bearer_header(frameio_token))
    end
  end
end
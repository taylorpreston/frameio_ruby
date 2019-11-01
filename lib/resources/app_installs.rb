module Frameio
  class AppInstalls < APIResource
    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    def self.find(frameio_token:)
      request(:get, "#{BASE_URL}/installations/for_me", authorize_bearer_header(frameio_token))
    end
  end
end
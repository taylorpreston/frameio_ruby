module Frameio
  class AppInstalls < APIResource
    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    def self.find(frameio_token:)
      request(:get, "/installations/for_me", frameio_token)
    end
  end
end
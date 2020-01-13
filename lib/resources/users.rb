module Frameio
  class Users < APIResource
    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    def self.find(frameio_token:)
      request(:get, "#{BASE_URL}/me", frameio_token)
    end
  end
end
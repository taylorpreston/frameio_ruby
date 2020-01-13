module Frameio
  class Accounts < APIResource
    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    def self.list(frameio_token:)
      request(:get, self.resouce_url, frameio_token)
    end
  
    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param account_id [String] Account Id
    def self.find(frameio_token:, account_id:)
      request(:get, "#{self.resouce_url}/#{account_id}", frameio_token)
    end
   
    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param account_id [String] Account Id
    def self.find_membership(frameio_token:, account_id:)
      request(:get, "#{self.resouce_url}/#{account_id}/membership", frameio_token)
    end

    def self.resouce_url
      "/accounts"
    end
  end 
end

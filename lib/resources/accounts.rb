module Frameio
  class Accounts < APIResource
    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    def self.list(frameio_token:)
      request(:get, self.resource_url, authorize_bearer_header(frameio_token))
    end
  
    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param account_id [String] Account Id
    def self.find(frameio_token:, account_id:),
      request(:get, "#{self.resource_url}/#{account_id}", authorize_bearer_header(frameio_token))
    end
   
    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param account_id [String] Account Id
    def self.find(frameio_token:, account_id:),
      request(:get, "#{self.resource_url}/#{account_id}/membership", authorize_bearer_header(frameio_token))
    end

    def self.resource_url
      "#{BASE_URL}/accounts"
    end
  end 
end
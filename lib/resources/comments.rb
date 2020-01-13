module Frameio
  class Comments < APIResource
    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    def self.list_replies(frameio_token:, comment_id:)
      request(:get, "#{self.resource_url}/#{comment_id}/replies", frameio_token)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    def self.list(frameio_token:, asset_id:)
      request(:get, "#{BASE_URL}/assets/#{asset_id}/comments", frameio_token)
    end
    
    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param comment_id [String] The Frame.io user's account ID
    def self.find(frameio_token:, comment_id:)
      request(:get, "#{self.resource_url}/#{comment_id}", frameio_token)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param comment_id [String] The Frame.io user's account ID
    # @param body [Object] The request body
    def self.create_reply(frameio_token:, comment_id:, body:)
      request(:post, "#{self.resource_url}/#{comment_id}/replies", frameio_token, body)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param comment_id [String] The Frame.io user's account ID
    # @param body [Object] The request body
    def self.create(frameio_token:, asset_id:, body:)
      request(:post, "/assets/#{asset_id}/comments", frameio_token, body)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param comment_id [String] The Frame.io user's account ID
    def self.update(frameio_token:, comment_id:, body:)
      request(:put, "#{self.resource_url}/#{comment_id}", frameio_token, body)
    end


    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param comment_id [String] The Frame.io user's account ID
    def self.destroy(frameio_token:, comment_id:)
      request(:delete, "#{self.resource_url}/#{comment_id}", frameio_token)
    end

    def self.resource_url
      "/comments"
    end 
  end 
end
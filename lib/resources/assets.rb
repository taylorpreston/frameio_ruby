module Frameio
  class Assets < APIResource
    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    # @param body[Object] This body of the request for adding a comment. 
    def self.add_comment(frameio_token:, asset_id:, body:)
      request(:post, "#{self.resouce_url(asset_id)}/comments", frameio_token, body)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    def self.list_children(frameio_token:, asset_id:)
      request(:get, "#{self.resouce_url(asset_id)}/children", frameio_token)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    def self.comments(frameio_token:, asset_id:)
      request(:get, "#{self.resouce_url(asset_id)}/comments", frameio_token)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    # @param body[Object] This body of the request. Must include name and file_size in bytes. 
    def self.create(frameio_token:, asset_id:, body:)
      request(:post, "#{self.resouce_url(asset_id)}/children", frameio_token, body)
    end


    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    def self.destroy(frameio_token:, asset_id:)
      request(:delete, self.resouce_url(asset_id), frameio_token)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    def self.find(frameio_token:, asset_id:)
      request(:get, self.resouce_url(asset_id), frameio_token)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    def self.subtitles(frameio_token:, asset_id:)
      request(:get, "#{self.resouce_url(asset_id)}/subtitles", frameio_token)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param query_params [String] Query parameters object that will search for an asset.
    def self.search(frameio_token:, query_params:)
      request(:get, self.search_url(query_params), frameio_token)
    end

        # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    def self.audio(frameio_token:, asset_id:)
      request(:get, "#{self.resouce_url(asset_id)}/audio", frameio_token)
    end


    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    # @param body[Object] This body of the request. Must include name and file_size in bytes. 
    def self.update(frameio_token:, asset_id:, body:)
      request(:put, self.resouce_url(asset_id), frameio_token, body)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    def self.unversion(frameio_token:, asset_id:)
      request(:delete, "#{self.resouce_url(asset_id)}/unversion", frameio_token)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    def self.add_version(frameio_token:, asset_id:, body:)
      request(:post, "#{self.resouce_url(asset_id)}/version", authorize_bearer_header(frameio_token, body))
    end

    def self.resouce_url(asset_id)
      "/assets/#{asset_id}"
    end

    def self.search_url(query_params)
      "/search/assets?#{to_query_string(query_params)}"
    end
  end 
end
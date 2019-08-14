module Frameio
  class Asset < APIResource

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    # @param body[Object] This body of the request for adding a comment. 
    def self.add_comment(frameio_token:, asset_id:, body:)
      response = request(:post, "#{self.resource_url(asset_id)}/comments", authorize_bearer_header(frameio_token), body)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    def self.list_children(frameio_token:, asset_id:)
      response = request(:get, "#{self.resource_url(asset_id)}/children", authorize_bearer_header(frameio_token))
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    def self.comments(frameio_token:, asset_id:)
      response = request(:get, "#{self.resource_url(asset_id)}/comments", authorize_bearer_header(frameio_token))
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    # @param body[Object] This body of the request. Must include name and file_size in bytes. 
    def self.create(frameio_token:, asset_id:, body:)
      response = request(:post, "#{self.resource_url(asset_id)}/children", authorize_bearer_header(frameio_token), body)
    end


    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    def self.destroy(frameio_token:, asset_id:)
      response = request(:delete, self.resource_url(asset_id), authorize_bearer_header(frameio_token))
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    def self.find(frameio_token:, asset_id:)
      response = request(:get, self.resource_url(asset_id), authorize_bearer_header(frameio_token))
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param query_params [String] Query parameters object that will search for an asset.
    def self.search(frameio_token:, query_params:)
      response = request(:get, self.search_url(query_params), authorize_bearer_header(frameio_token))
    end


    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    # @param body[Object] This body of the request. Must include name and file_size in bytes. 
    def self.update(frameio_token:, asset_id:, body:)
      response = request(:put, self.resource_url(asset_id), authorize_bearer_header(frameio_token), body)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    def self.unversion(frameio_token:, asset_id:)
      response = request(:delete, "#{self.resource_url(asset_id)}/unversion", authorize_bearer_header(frameio_token))
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io project asset folder id
    def self.add_version(frameio_token:, asset_id:, body:)
      response = request(:post, "#{self.resource_url(asset_id)}/version", authorize_bearer_header(frameio_token, body))
    end

    def self.resource_url(asset_id)
      "#{BASE_URL}/assets/#{asset_id}"
    end

    def self.search_url(query_params)
      "#{BASE_URL}/search/assets?#{to_query_string(query_params)}"
    end
  end 
end
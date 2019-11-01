module Frameio
  class ReviewLinks < APIResource
    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param project_id [String] the Frame.io project id.
    def self.list_by_project(frameio_token:, project_id:)
      request(:get, "#{BASE_URL}/projects/#{project_id}/review_links", authorize_bearer_header(frameio_token))
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param project_id [String] the Frame.io project id.
    # @param body [Object] the request body.
    def self.create(frameio_token:, project_id:, body:)
      request(:post, "#{BASE_URL}/projects/#{project_id}/review_links", authorize_bearer_header(frameio_token), body:)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param review_link_id [String] the Frame.io project id.
    # @param query_params [Object] an object that will be turned into a query string.
    def self.find(frameio_token:, review_link_id:, query_params: nil)
      url = query_params ? "#{self.resource_url}/#{review_link_id}?#{to_query_string(query_params)}"
      request(:get, "#{self.resource_url}/#{review_link_id}", authorize_bearer_header(frameio_token))
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param review_link_id [String] the Frame.io project id.
    def self.find_items(frameio_token:, review_link_id:, query_params: nil)
      url = query_params ? "#{self.resource_url}/#{review_link_id}/items?#{to_query_string(query_params)}"
      request(:get, url, authorize_bearer_header(frameio_token))
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param review_link_id [String] the Frame.io project id.
    def self.destroy(frameio_token:, review_link_id:)
      request(:delete, "#{self.resource_url}/#{review_link_id}", authorize_bearer_header(frameio_token))
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param review_link_id [String] the Frame.io project id.
    def self.update(frameio_token:, review_link_id:, body:)
      request(:put, "#{self.resource_url}/#{review_link_id}", authorize_bearer_header(frameio_token), body:)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param review_link_id [String] The Frame.io review link id.
    # @param body [Object] request body
    def add_asset(frame_token:, review_link_id:, body:)
      request(:post, "#{self.resource_url}/#{review_link_id}/assets", authorize_bearer_header(frameio_token), body)
    end
    
    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param team_id [String] The Frame.io team ID
    # @param body [Object] The request body for this requst. 
    def self.add_member(frameio_token:, team_id:, body:)
      request(:post, self.resource_url, authorize_bearer_header(frameio_token), body)
    end

    def self.resource_url
      "#{BASE_URL}/review_links"
    end 
  end 
end